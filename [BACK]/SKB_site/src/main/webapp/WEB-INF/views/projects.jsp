<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="title" value="Проекты"/>

<!doctype html>
<html lang="ru">
<head>
  <meta charset="utf-8" />
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="icon" href="${contextPath}/resources/images/logo.png">

  <title>${title}</title>
  <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/project.css">
</head>

<body>

  <div id="leftSide">
  </div>
  <div id="rightSide">
  </div>


  <%@include file="header.jsp" %>

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
      <sec:authorize access="hasRole('ROLE_ADMIN') or '${!empty logUser}'">
        <div class="col-xs-offset-1 col-xs-3 col-sm-offset-3 col-xs-3">
            <input type="button" class="btn btn-back btn-lg" onClick="self.location.href='/add-project';" value="Добавить проект">
        </div>
      </sec:authorize>
    </div>
    <!--Новости уровень 1-->

    <c:if test="${!empty projectsList}">
      <c:forEach items="${projectsList}" var="project">
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
              <sec:authorize access="hasRole('ROLE_ADMIN') or '${logUser.username == project.captain.username }'">
                <div class="form-group">
                  <input type="button" class="btn btn-back btn-lg" onClick="self.location.href='/edit-project?projectId=${project.id}';" value="Редактировать">
                  <form method="POST" action="/delete-project" class="btn">
                    <input type="hidden" value="${project.id}" name="projectId"/>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-back btn-lg" onClick="(confirm('Вы уверены, что хотите удалить проект?'))">Удалить</button>
                  </form>
                </div>
              </sec:authorize>
            </div>
          </div>

          <div class="col-xs-4 image hidden-xs hidden-sm">
            <img class="about-images" src="${project.photoPath}" alt="${project.name} Picture" width="100%">
          </div>
        </div>
      </c:forEach>
    </c:if>
  <c:if test="${empty projectsList}">
      <h1>
        К сожалению на данный момент проектов нет<br>
        :(
      </h1>
  </c:if>
</div>

  <%@include file="footer.jsp"%>

  <script src="../../resources/js/jquery.min.js"></script>
  <script src="../../resources/js/jquery-3.1.1.slim.min.js"></script>
  <script>window.jQuery</script>
  <script src="../../resources/js/tether.min.js"></script>
  <script src="../../resources/bootstrap/js/bootstrap.js"></script>

</body>

</html>
