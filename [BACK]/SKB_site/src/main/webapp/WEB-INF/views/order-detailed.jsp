<%@page pageEncoding="UTF-8"%>
<%@include file="includes/aboveHtml.jsp"%>
<c:set var="title" value="Заказ '${order.name}'"/>
<!doctype html>
<html lang="ru">
<head>
  <%@include file="includes/head.jsp"%>
  <link rel="stylesheet" type="text/css" href="/resources/css/order-detailed.css">
  <title>${title}</title>
</head>
<body>

  <div id="leftSide">
  </div>
  <div id="rightSide">
  </div>

  <%@include file="includes/header.jsp" %>

  <spring:message code="${orderEditSuccess}"/>

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
            <h3>${title}</h3>
          </li>
        </ul>
      </div>
    </div>
    <c:if test = "${!empty order}">
    <sec:authorize access="hasRole('ROLE_ADMIN') or hasRole('ROLE_MODERATOR') or '${logUser.username == item.author.username}'">
      <div class="form-group">
        <input type="button" class="btn btn-back btn-md" onClick="window.history.back()" value="Назад">
        <input type="button" class="btn btn-back btn-md" onClick="self.location.href='/edit-order?orderId=${item.id}';" value="Редактировать">
        <input type="button" class="btn btn-back btn-lg" onClick="(return confirm('Вы уверены, что хотите удалить этот заказ?'))?self.location.href='/del-order?orderId=${order.id}':1/1;" value="Удалить">
      </div>
    </sec:authorize>
    <div class="row ">
      <div class="col-xs-12">
        <div class="new">
          <p class="title">
            ${order.name}
          </p>
          <p>
            Модерация:
            <c:if test="${order.checked}">
              пройдена
            </c:if>
            <c:if test="${!order.checked}">
              не пройдена
            </c:if>
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

</body>
</html>
