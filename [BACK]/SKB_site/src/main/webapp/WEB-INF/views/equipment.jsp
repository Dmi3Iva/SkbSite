<%@page pageEncoding="UTF-8"%>
<%@include file="includes/aboveHtml.jsp"%>

<c:set var="title" value="Оборудование"/>
<!doctype html>
<html lang="ru">
<head>

    <title>${title}</title>

    <link rel="stylesheet" type="text/css" href="/resources/css/equipment.css">
    <%@include file="includes/head.jsp"%>
</head>
<body>

  <div id="leftSide">
  </div>
  <div id="rightSide">
  </div>


  <%@include file="includes/header.jsp" %>

<!-- main-->
<div class="container">

  <div class="row">
    <div class="col-xs-6" >
      <ul class="titleHead">
        <li><div class="smallBlueBox"></div></li>
        <li><h3>${title}</h3></li>
      </ul>
    </div>
    <sec:authorize access="hasRole('ROLE_ADMIN') or '${!empty logUser}'">
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

<%@include file="includes/footer.jsp"%>
  <script type="text/javascript">
      var $c = $('.itemsEq');
      while($c.children('div:not(.row)').length)
      $c.children('div:not(.row):lt(3)').wrapAll('<div class="row">');
  </script>
</body>

</html>
