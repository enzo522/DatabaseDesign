<%--
  Created by IntelliJ IDEA.
  User: KimSungsoo
  Date: 17. 12. 5.
  Time: 06:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="import.jsp" %>
<html>
<head>
    <title>Login Page</title>
    <script>
        function checkValue() {
            inputForm = eval('document.loginInfo');

            if (!inputForm.id.value) {
                alert('아이디를 입력하세요.');
                inputForm.id.focus();

                return false;
            }

            if (!inputForm.pw.value) {
                alert('비밀번호를 입력하세요.');
                inputForm.pw.focus();

                return false;
            }
        }
    </script>
</head>
<body>
    <div class="loginForm">
        <form name="loginInfo" method="post" action="loginCheck.jsp" onsubmit="return checkValue()">
            <table>
                <tr>
                    <td>ID: </td>
                    <td><input type="text" name="id"></td>
                </tr>
                <tr>
                    <td>PW: </td>
                    <td><input type="password" name="pw"></td>
                </tr>
            </table>
            <input type="submit" value="Login">
        </form>
    </div>

<%
    String msg = request.getParameter("msg");

    if (msg != null && msg.equals("0")) {
        out.println("<font color='red'>아이디 혹은 비밀번호를 확인해주세요.</font>");
    } else if (msg != null && msg.equals("-1")) {
        out.println("<font color='red'>경영진만 접근이 가능합니다.</font>");
    }
%>
</body>
</html>
