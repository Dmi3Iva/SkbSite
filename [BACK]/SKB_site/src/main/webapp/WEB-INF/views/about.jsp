<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8"/>
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="${contextPath}/resources/images/logo.png">

    <title>СКБ</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/about.css">
</head>
<body>

<div id="leftSide">
</div>
<div id="rightSide">
</div>

<%@include file="header.jsp" %>

<div class="container content">
    <div class="row">
        <div class="col-sm-4 col-sm-offset-2">
            <div class="text">
                <p>Мы студентческое конструкторское бюро БФУ им. Иммануила Канта. </p>
            </div>
        </div>
        <div class="col-sm-4">
            <img class="image" src="../../resources/images/Photo/IMG_0019.JPG">
        </div>
    </div>
</div>

<%@include file="footer.jsp" %>

  <script src="../../resources/js/jquery.min.js"></script>
  <script src="../../resources/js/jquery-3.1.1.slim.min.js"></script>
  <script>window.jQuery</script>
  <script src="../../resources/js/tether.min.js"></script>
  <script src="../../resources/bootstrap/js/bootstrap.js"></script>

</body>

</html>
