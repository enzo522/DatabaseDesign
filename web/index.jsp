<%--
  Created by IntelliJ IDEA.
  User: KimSungsoo
  Date: 17. 12. 5.
  Time: 02:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="import.jsp" %>
<html>
  <head>
    <title>Database Design</title>
    <script>
      $(document).ready(function () {
          $('#login').click(function () {
              document.location = 'http://localhost:8081/loginPage.jsp';
          });

          $('#table').click(function () {
              document.location = 'http://localhost:8081/tableList.jsp';
          });
      });
    </script>
  </head>
  <body>
    <div class="mainPage">
      <button id="login">프로젝트 관리</button>
      <button id="table">데이터 확인</button>
    </div>
  </body>
</html>
