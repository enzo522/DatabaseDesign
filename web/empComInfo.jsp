<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.ResultSetMetaData" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: KimSungsoo
  Date: 17. 12. 5.
  Time: 05:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="connection.jsp" %>
<html>
<head>
    <title>Employee Commitments Info</title>
</head>
<body>
<%
    ResultSet rs = null;
    ResultSetMetaData rsmd = null;

    try {
        String empNo = request.getParameter("selectedEmp");
        String sql = "SELECT EMPLOYEES.EMP_NO, EMPLOYEES.EMP_NAME, PROJECTS.PROJ_NAME, " +
                            "COMMITMENTS.OFFICE_NAME, DATEDIFF(COMMITMENTS.WDL_DATE, COMMITMENTS.CMT_DATE), " +
                            "EMPLOYEES.DEGREE, DEVELOPERS.CAREER, DEVELOPERS.GRADE " +
                        "FROM EMPLOYEES NATURAL JOIN COMMITMENTS NATURAL JOIN PROJECTS NATURAL JOIN DEVELOPERS " +
                        "WHERE EMPLOYEES.EMP_NO = " + Integer.parseInt(empNo);

        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        rsmd = rs.getMetaData();
%>
    <div class="devInfo">
        <table border="1">
            <tr>
                <td>사번</td>
                <td>사원명</td>
                <td>프로젝트명</td>
                <td>직무명</td>
                <td>투입기간(일)</td>
                <td>최종학력</td>
                <td>경력</td>
                <td>기술등급</td>
            </tr>
<%
        while (rs.next()) {
%>
            <tr>
<%
            for (int i = 1; i <= rsmd.getColumnCount(); i++) {
%>
                <td><%= rs.getString(i) %></td>
<%
            }
%>
            </tr>
<%
        }
%>
        </table>
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
