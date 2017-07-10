<%@page pageEncoding="UTF-8"%>
<%@include file="includes/aboveHtml.jsp"%>
<c:set var="title" value="Проекты"/>
<!doctype html>
<html lang="ru">
<head>
  <%@include file="includes/head.jsp"%>
  <link rel="stylesheet" type="text/css" href="/resources/css/project.css">
  <title>${title}</title>
</head>

<body>

  <div id="leftSide">
  </div>
  <div id="rightSide">
  </div>


  <%@include file="includes/header.jsp" %>

  <spring:message code="${projectAddSuccess}"/>
  <spring:message code="${projectDeleteSuccess}"/>

  <div class="container content">
    <!--Новости и проекты-->
    <div class="row">
      <!--Новости раздел-->
      <div class="col-xs-6">
        <ul class="titleHead">
          <li>
            <div class="smallBlueBox"></div>
          </li>
          <li>
            <h3>${title}</h3></li>
        </ul>
      </div>
      <sec:authorize access="hasRole('ROLE_ADMIN') or hasRole('ROLE_MODERATOR') or (hasRole('ROLE_MEMBER') and '${logUser.checked == true}')">
        <div class="col-xs-offset-1 col-xs-3 col-sm-offset-3 col-xs-3">
            <input type="button" class="btn btn-back btn-lg" onClick="self.location.href='/add-project';" value="Добавить проект">
        </div>
      </sec:authorize>
    </div>
    <!--Новости уровень 1-->

    <c:if test="${!empty projectsList}">
      <c:forEach items="${projectsList}" var="project">
        <c:if test="${(project.checked) or ((!project.checked) and ((logUser.username == project.captain.username) or (logUser.role.id == 3) or (logUser.role.id == 4)))}">
        <div class="row">
          <div class="col-md-8">
            <div class="new">
              <p class="title">
                <a href="/project-detailed?projectId=${project.id}">${project.name}</a>
              </p>
              <p>Капитан команды:
                <a href="/id${project.captain.id}">${project.captain.username}</a>
              </p>
              <p>Статус проекта: ${project.projectStatus.name}</p>
              <div class="progress">
                <div class="progress-bar" role="progressbar" aria-valuenow="${project.statusPercent}" aria-valuemin="0" aria-valuemax="100" style="width: ${project.statusPercent}%;">
                  ${project.statusPercent}
                </div>
              </div>

                  <p class="description">
                      Дата начала: ${project.dateOfStart}
                      <c:if  test="${project.dateOfLastUpdate != project.dateOfStart} ">
                        Последнее обновление: ${project.dateOfLastUpdate}
                      </c:if>
                  </p>

              <p>Описание:</p>

              <p class="article">
                ${project.about}
              </p>
                  <a href="/project-detailed?projectId=${project.id}">Подробнее...</a>
              <sec:authorize access="hasRole('ROLE_ADMIN') or hasRole('ROLE_MODERATOR') or '${logUser.username == project.captain.username }'">
                <div class="form-group">
                  <input type="button" class="btn btn-back btn-lg" onClick="self.location.href='/edit-project?projectId=${project.id}';" value="Редактировать">
                  <form method="POST" action="/delete-project" class="btn">
                    <input type="hidden" value="${project.id}" name="projectId"/>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-back btn-lg" onClick="return confirm('Вы уверены, что хотите удалить проект?')">Удалить</button>
                  </form>
                </div>
              </sec:authorize>
            </div>
          </div>
        </div>
        </c:if>
      </c:forEach>
    </c:if>
  <c:if test="${empty projectsList}">
      <h1>
        К сожалению на данный момент проектов нет<br>
        :(
      </h1>
  </c:if>
</div>

  <%@include file="includes/footer.jsp"%>


</body>

</html>
