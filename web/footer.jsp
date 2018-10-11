<%--
  Created by IntelliJ IDEA.
  User: KimSungsoo
  Date: 17. 12. 5.
  Time: 04:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (rs != null) {
        try {
            rs.close();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }

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
%>
