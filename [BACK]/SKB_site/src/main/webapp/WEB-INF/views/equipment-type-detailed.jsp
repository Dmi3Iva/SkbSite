<%@page pageEncoding="UTF-8"%>
<%@include file="includes/aboveHtml.jsp"%>
<c:set var="title" value="${equipmentType.name}"/>
<!doctype html>
<html lang="ru">
<head>
    <%@include file="includes/head.jsp"%>
    <link rel="stylesheet" type="text/css" href="/resources/css/equipment_item.css">
    <title>${title}</title>
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
          <li><h3>${title}</h3></li>
        </ul>
      </div>
      <sec:authorize access="hasRole('ROLE_ADMIN') or hasRole('ROLE_MODERATOR')">
        <div class="col-xs-3">
          <a href="/equipment-table-${equipmentType.id}" class="btn btn-primary" role="button">
            Просмотреть список устройств <span class="badge">${equipmentType.equipmentSet.size()}</span>
          </a>
        </div>
      </sec:authorize>
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
          <sec:authorize access="hasRole('ROLE_MODERATOR') or hasRole('ROLE_ADMIN') or hasRole('ROLE_MEMBER')">
            <button type="submit" class="btn btn-primary">Добавить к бронированию</button>
          </sec:authorize>
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
