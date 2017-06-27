<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ru">

<head>
  <meta charset="utf-8" />
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="icon" href="${contextPath}/resources/images/logo.png">
  <title>СКБ</title>
  <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/order-detailed.css">
</head>
<body>

  <div id="leftSide">
  </div>
  <div id="rightSide">
  </div>

  <%@include file="includes/header.jsp" %>

  <div class="container content">
    <!--Новости и проекты-->
    <div class="row">
      <!--Новости раздел-->
      <div class="col-md-6">
        <ul class="titleHead">
          <li>
            <div class="smallBlueBox"></div>
          </li>
          <li>
            <h3>Заказ</h3></li>
        </ul>
      </div>
    </div>
    <c:if test = "${!empty order}">
    <div class="row">
      <div class="col-xs-12 image"><img src="${order.photoPath}" alt="${order.name} Картинка" width="100%"></div></div>
    <div class="row ">
      <div class="col-xs-12">
        <div class="new">
          <p class="title">
            ${order.name}
          </p>
          <p class="article">
            ${order.content}
          </p>
          <c:if test="${!empty order.project}">
            <a href="/project-detailed?projectId=${order.project.id}">${order.project.name}</a>
          </c:if>
          <p class="description">
            Автор: <a href="/id${order.author.id}">${order.author.username}</a><br>
            <c:if test="${order.timeOfCreation == order.timeOfLastUpdate}">
              ${order.timeOfCreation}
            </c:if>

            <c:if test="${order.timeOfCreation != order.timeOfLastUpdate}">
              <c:if test="${order.editor.username!= order.author.username}">
                Редактор: <a href="/id${order.editor.id}">${order.editor.username}</a> <br>
              </c:if>
              <span class="glyphicon glyphicon-pencil"></span> Изменено ${order.timeOfLastUpdate}
            </c:if>
          </p>
        </div>
      </div>
      </c:if>
    </div>
  </div>
<!-- /container -->

<%@include file="includes/footer.jsp" %>

<script src="../../resources/js/jquery.min.js"></script>
<script src="../../resources/js/jquery-3.1.1.slim.min.js"></script>
<script>window.jQuery</script>
<script src="../../resources/js/tether.min.js"></script>
<script src="../../resources/bootstrap/js/bootstrap.js"></script>

</body>
</html>
