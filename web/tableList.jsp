<%--
  Created by IntelliJ IDEA.
  User: KimSungsoo
  Date: 17. 12. 5.
  Time: 06:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="import.jsp" %>
<html>
<head>
    <title>Table List</title>
    <script>
        $(document).ready(function () {
            $('button').click(function () {
                document.location = 'http://localhost:8081/tableView.jsp?selectedTable=' + $(this).attr('id');
            });
        });
    </script>
</head>
<body>
    <div class="tableList">
        <p>데이터를 확인할 테이블을 선택하세요.</p>
        <button id="EMPLOYEES">사원</button>
        <button id="DEVELOPERS">개발자</button>
        <button id="DEPARTMENTS">부서</button>
        <button id="PROJECTS">프로젝트</button>
        <button id="COMMITMENTS">투입</button>
        <button id="CLIENTS">고객</button>
        <button id="ACCOUNTS">회원</button>
        <button id="CL_EXAMINATIONS">고객평가</button>
        <button id="CL_EXAMINERS">고객평가자</button>
        <button id="CW_EXAMINATIONS">동료평가</button>
        <button id="CW_EXAMINERS">동료평가자</button>
        <button id="PM_EXAMINATIONS">PM평가</button>
        <button id="PM_EXAMINERS">PM평가자</button>
    </div>
</body>
</html>
