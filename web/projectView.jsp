<%--
  Created by IntelliJ IDEA.
  User: KimSungsoo
  Date: 17. 12. 5.
  Time: 03:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="connection.jsp"%>
<html>
<head>
    <title>WIP Projects</title>
    <script>
        $(document).ready(function () {
            $('button').click(function () {
                document.location = 'http://localhost:8081/projectInfo.jsp?selectedProject=' + $(this).attr('id');
            });
        })
    </script>
</head>
<body>
<%
    ResultSet rs = null;
    ResultSetMetaData rsmd = null;

    try {
        String sql = "SELECT * FROM PROJECTS WHERE STATUS = 'WIP'";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        rsmd = rs.getMetaData();
        int count = 0;
%>
    <div class="wipList">
        <p>프로젝트를 선택하세요.</p>
<%
        while (rs.next()) {
            for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                if (rsmd.getColumnName(i).equals("PROJ_NO")) {
%>
        <button id="<%= rs.getString(i) %>"><%= rs.getString(i + 1) %></button>
<%
                    count++;
                }
            }
        }
%>
    <p>현재 <%= count %>개의 프로젝트가 진행 중입니다.</p>
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
