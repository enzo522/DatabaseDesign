<%--
  Created by IntelliJ IDEA.
  User: KimSungsoo
  Date: 17. 12. 5.
  Time: 07:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="member.Member" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    Member member = Member.getInstance();
    int check = member.loginCheck(id, pw);
    String msg = null;

    if (check == 1) msg = "projectView.jsp";
    else msg = "loginPage.jsp?msg=" + check;

    response.sendRedirect(msg);
%>
</body>
</html>
