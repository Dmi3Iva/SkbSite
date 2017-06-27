<%@page pageEncoding="UTF-8"%>
<meta charset="utf-8"/>
<meta name="description" content="">
<meta name="author" content="">
<meta name="_csrf_parameter" content="_csrf" />
<meta name="_csrf_header" content="X-CSRF-TOKEN" />
<meta name="_csrf" content="${_csrf.token}" />

<form id="logoutForm" method="POST" action="${contextPath}/logout">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

<link rel="icon" href="/resources/images/logo.png">
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<link href="/resources/css/footer.css" rel="stylesheet">
<script src="/resources/js/jquery-3.2.1.min.js"></script>
<script src="../../../resources/bootstrap/js/bootstrap.js"></script>