<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: KimSungsoo
  Date: 17. 12. 5.
  Time: 06:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="connection.jsp" %>
<html>
<head>
    <title>Table View</title>
</head>
<body>
<%
    ResultSet rs = null;
    ResultSetMetaData rsmd = null;

    try {
        String tableName = request.getParameter("selectedTable");
        String sql = "SELECT * FROM " + tableName;
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        rsmd = rs.getMetaData();
        int count = 0;
%>
    <div class="tableView">
        <table border="1">
            <tr>
<%
        for (int i = 1; i <= rsmd.getColumnCount(); i++) {
%>
                <td><%= rsmd.getColumnName(i) %></td>
<%
        }
%>
            </tr>
<%
        while (rs.next()) {
%>
            <tr>
<%
            for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                if (tableName.equals("ACCOUNTS") && i == 2) {
%>
                <td>********</td>
<%
                } else {
%>
                <td><%= rs.getString(i) %></td>
<%
                }
            }
%>
            </tr>
<%
            count++;
        }
%>
        </table>
        <p>총 튜플의 수: <%= count %>개</p>
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
