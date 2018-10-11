<%--
  Created by IntelliJ IDEA.
  User: KimSungsoo
  Date: 17. 12. 5.
  Time: 04:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="connection.jsp" %>
<html>
<head>
    <title>Project Info</title>
    <script>
        $(document).ready(function () {
            $('button').click(function () {
                document.location = 'http://localhost:8081/empComInfo.jsp?selectedEmp=' + $(this).attr('id');
            });
        })
    </script>
</head>
<body>
<%
    ResultSet rs = null;
    ResultSetMetaData rsmd = null;

    try {
        String projNo = request.getParameter("selectedProject");
        String sql = "SELECT PROJECTS.PROJ_NO, PROJECTS.PROJ_NAME, PROJECTS.CLIENT_NAME, " +
                "EMPLOYEES.EMP_NO, EMPLOYEES.EMP_NAME, " +
                "COMMITMENTS.OFFICE_NAME, COMMITMENTS.CMT_DATE, COMMITMENTS.WDL_DATE, " +
                "DATEDIFF(COMMITMENTS.WDL_DATE, COMMITMENTS.CMT_DATE)" +
                "FROM COMMITMENTS NATURAL JOIN PROJECTS NATURAL JOIN EMPLOYEES " +
                "WHERE PROJECTS.PROJ_NO = " + Integer.parseInt(projNo);

        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        rsmd = rs.getMetaData();
        int count = 0;
%>
    <div class="projInfo">
        <table border="1">
            <tr>
                <td>프로젝트 번호</td>
                <td>프로젝트명</td>
                <td>고객명</td>
                <td>사번</td>
                <td>사원명</td>
                <td>직무명</td>
                <td>투입일자</td>
                <td>철수일자</td>
                <td>투입기간(일)</td>
            </tr>
<%
        while (rs.next()) {
%>
            <tr>
<%
            for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                if (i != 4) {
%>
                <td><%= rs.getString(i) %></td>
<%
                } else {
%>
                <td><button id="<%= rs.getString(i) %>"><%= rs.getString(i) %></button></td>
<%
                }
            }

            count++;
        }
%>
            </tr>
        </table>
        <p>현재 해당 프로젝트에는 <%= count %>명의 사원이 투입되어 있습니다.</p>
    </div>
<%
    } catch (SQLException ex) {
        ex.printStackTrace();

        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException sqle) {
                sqle.printStackTrace();
            }
        }
    }
%>
<%@ include file="footer.jsp" %>
</body>
</html>
