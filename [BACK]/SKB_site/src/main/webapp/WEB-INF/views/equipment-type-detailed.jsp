<%@page pageEncoding="UTF-8"%>
<%@include file="includes/aboveHtml.jsp"%>
<!doctype html>
<html lang="ru">
<head>
    
    <title>СКБ</title>
    
    <%@include file="includes/head.jsp"%>
    <link rel="stylesheet" type="text/css" href="/resources/css/equipment_item.css">
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
      <div class="col-xs-9" >
        <ul class="titleHead">
          <li><div class="smallBlueBox"></div></li>
          <li><h3>Оборудование</h3></li>
        </ul>
      </div>
      <div class="col-xs-3">
        <a href="/equipment-table-${equipmentType.id}" class="btn btn-primary" role="button">
          Просмотреть список устройств <span class="badge">${equipmentType.equipmentSet.size()}</span>
        </a>
      </div>
    </div>
    <c:if test="${!empty equipmentType}">
    <div class="row ">
      <div class="col-md-6 ">
        <div class = "titleName my-auto">
          <h4 class= "my-auto">${equipmentType.name}</h4>
        </div>
        <div class="image">
          <img src="${equipmentType.photoPath}" alt="Микроконтроллер1">
        </div>
      </div>
      <div class="col-md-6">
        <h5>Описание</h5>
        ${equipmentType.about}
        <form action="equipment-type-detailed" method="post">
          <input type="hidden" name="id" value="${equipmentType.id}"/>
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          <button type="submit" class="btn btn-primary">Добавить к бронированию</button>
        </form>
      </div>
    </div>
  </div>
    <div class="container">
      <div class="rows">
        <div class="col-md-6">
          <h4>Характеристики</h4>
        </div>
      </div>
      <div class="rows">
        <div class="col-md-8">
            ${equipmentType.features}
        </div>
      </div>
    </div>
  </c:if>

  <%@include file="includes/footer.jsp" %>

</body>
</html>
