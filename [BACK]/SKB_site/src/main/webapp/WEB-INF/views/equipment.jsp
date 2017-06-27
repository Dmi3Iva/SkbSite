<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="title" value="Оборудование"/>

<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8"/>
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="${contextPath}/resources/images/logo.png">

    <title>${title}</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/equipment.css">
    <script src="../../resources/js/jquery.min.js"></script>
    <script src="../../resources/js/jquery-3.1.1.slim.min.js"></script>
    <script>window.jQuery</script>
    <script src="../../resources/js/tether.min.js"></script>
    <script src="../../resources/bootstrap/js/bootstrap.js"></script>

    <script>
        //обернули классы в которых нужно удалить класс row

    </script>
</head>
<body>

  <div id="leftSide">
  </div>
  <div id="rightSide">
  </div>


  <%@include file="header.jsp" %>

<!-- main-->
<div class="container">

  <div class="row">
    <div class="col-xs-6" >
      <ul class="titleHead">
        <li><div class="smallBlueBox"></div></li>
        <li><h3>${title}</h3></li>
      </ul>
    </div>
    <sec:authorize access="hasRole('ROLE_ADMIN') or hasRole('ROLE_MODERATOR')">
      <div class="col-xs-offset-1 col-xs-3 col-sm-offset-3 col-xs-3">
        <input type="button" class="btn btn-back btn-lg" onClick="self.location.href='/add-equipment-type';" value="Добавить модель">
      </div>
    </sec:authorize>
      <div class="col-xs-3">
          <a class="btn btn-lg btn-primary" href="/equipment-booking">
              Корзина <span class="badge">
                <c:if test="${empty basket}">0</c:if>
              <c:if test="${!empty basket}">${basket.size()}</c:if>
                </span>
          </a>
      </div>
  </div>

  <c:if test="${empty equipmentTypeList}">
      <h1>
        К сожалению на данный момент оборудования нет<br>
        :(
      </h1>
  </c:if>

  <c:if test="${!empty equipmentTypeList}">
      <div class="itemsEq">
    <c:forEach items="${equipmentTypeList}" var="item">
  <div class="itemEquipment" >
    <div class="col-xs-4 " >
      <div class="item">
        <a href="/equipment-type-detailed?id=${item.id}">
          <div class="col-xs-6 hidden-xs">
              <img src="${item.photoPath}" alt="${item.name}Picture" width=100%>
          </div>
          <div class="col-xs-6 hidden-xs">
            <p>${item.name}</p>
          </div>

          <div class="col-xs-12 visible-xs">
            <p>${item.name}</p>
          </div>
        </a>
          <div class="form-group">
              <input type="button" class="btn btn-back btn-lg" onClick="self.location.href='/edit-equipment-type?id=${item.id}';" value="Редактировать">
              <input type="button" class="btn btn-back btn-lg" onClick="(confirm('Вы уверены что хотите удалить модель?'))?self.location.href='/del-equipment-type?id=${item.id}':1/1;" value="Удалить">
          </div>
      </div>
    </div>
  </div>
  </c:forEach>
      </div>
  </c:if>

</div>

<%@include file="footer.jsp"%>

  <!--end main-->


  <script type="text/javascript">
      var $c = $('.itemsEq');
      while($c.children('div:not(.row)').length)
      $c.children('div:not(.row):lt(3)').wrapAll('<div class="row">');
  </script>
</body>

</html>
