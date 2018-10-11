<%--
  Created by IntelliJ IDEA.
  User: KimSungsoo
  Date: 17. 12. 5.
  Time: 02:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="import.jsp" %>
<%@ page import="java.sql.*" %>
<%
    Connection con = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException cnfe) {
        cnfe.printStackTrace();
    }

    try {
        String jdbcUrl = "jdbc:mysql://localhost:3306/DBArch";
        String userId = "dbarch";
        String userPass = "dbarch";

        con = DriverManager.getConnection(jdbcUrl, userId, userPass);
    } catch (SQLException ex) {
        ex.printStackTrace();

        if (ps != null) {
            try {
                ps.close();
            } catch (SQLException sqle) {
                sqle.printStackTrace();
            }
        }

        if (con != null) {
            try {
                con.close();
            } catch (SQLException sqle) {
                sqle.printStackTrace();
            }
        }
    }
%>