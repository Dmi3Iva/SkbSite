<%@page pageEncoding="UTF-8"%>
<%@include file="includes/aboveHtml.jsp"%>
<c:set var="title" value="Заказы"/>
<!doctype html>
<html lang="ru">

<head>

  <%@include file="includes/head.jsp"%>
  <link rel="stylesheet" type="text/css" href="/resources/css/order.css">
  <title>${title}</title>
  <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/order.css">
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
      <div class="col-xs-6" >
        <ul class="titleHead">
          <li><div class="smallBlueBox"></div></li>
          <li><h3>${title}</h3></li>
        </ul>
      </div>
      <sec:authorize access="hasRole('ROLE_ADMIN') or '${!empty logUser}'">
        <div class="col-xs-offset-1 col-xs-3 col-sm-offset-3 col-xs-3">
          <input type="button" class="btn btn-back btn-lg" onClick="self.location.href='/add-order';" value="Добавить заказ">
        </div>
      </sec:authorize>
    </div>
<c:if test="${!empty ordersList}">
  <c:forEach items="${ordersList}" var="item">
    <div class="row">
      <div class="col-md-8">
        <div class="new">
          <p class="title">
              ${item.name}
          </p>
          <p class="article">
              ${item.content}
          </p>
          <c:if test="${!empty item.project}">
            <a href="/project-detailed?projectId=${item.project.id}">${item.project.name}</a>
          </c:if>
          <ul class="detailes">
            <li>
              <a href="/order-detailed?orderId=${item.id}">Подробнее...</a>
            </li>
            <li>
              <p class="description">
                Автор: <a href="/id${item.author.id}">${item.author.username}</a><br>
                <c:if test="${item.timeOfCreation == item.timeOfLastUpdate}">
                  <span class="glyphicon glyphicon-plus"></span> Добавлено ${item.timeOfCreation}
                </c:if>
                <c:if test="${item.timeOfCreation != item.timeOfLastUpdate}">
                  <c:if test="${item.editor.username!= item.author.username}">
                    Редактор: <a href="/id${item.editor.id}">${item.editor.username}</a> <br>
                  </c:if>
                  <span class="glyphicon glyphicon-pencil"></span> Изменено ${item.timeOfLastUpdate}
                </c:if>
              </p>
            </li>
            <sec:authorize access="hasRole('ROLE_ADMIN') or '${logUser.username == item.author.username}'">
              <div class="form-group">
                <input type="button" class="btn btn-back btn-lg" onClick="self.location.href='/edit-order?orderId=${item.id}';" value="Редактировать">
                <input type="button" class="btn btn-back btn-lg" onClick="(confirm('Вы уверены что хотите удалить новость?'))?self.location.href='/del-order?orderId=${item.id}':1/1;" value="Удалить">
              </div>
            </sec:authorize>
          </ul>
        </div>
      </div>

    </div>
  </c:forEach>
</c:if>
    <c:if test="${empty ordersList}">
        <h1>
          К сожалению заказов на данный момент нет<br>
          :(
        </h1>
    </c:if>
</div>

  <%@include file="includes/footer.jsp"%>
</body>

</html>
