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
  <link rel="stylesheet" type="text/css" href="../../resources/css/project-detailed.css">
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
      <div class="col-md-6">
        <ul class="titleHead">
          <li>
            <div class="smallBlueBox"></div>
          </li>
          <li>
            <h3>Проект "${project.name}"</h3></li>
        </ul>
      </div>
    </div>
    <!--IIMAGE 1-->
    <c:if test="${!empty project}">
      <div class="form-group">
        <input type="button" class="btn btn-back btn-lg" onClick="self.location.href='/edit-project?id=${item.id}';" value="Редактировать">
        <input type="button" class="btn btn-back btn-lg" onClick="(confirm('Вы уверены что хотите удалить проект?'))?self.location.href='/del-project?id=${item.id}':1/1;" value="Удалить">
      </div>
        <div class="row">
          <div class="col-md-8">
            <div class="new">
              <p class="title">
                  ${project.name}
              </p>
              <p>
                Капитан:
                ${project.captain.username}
              </p>
                <p>
                    Команда:
                    <c:forEach items="${projectTeam}" var="member">
                        ${member.username},
                    </c:forEach>
                </p>
              <p>
                Статус проекта:
                  ${project.projectStatus.name}
              </p>
              <div class="progress">
                <div class="progress-bar" role="progressbar" aria-valuenow="${project.statusPercent}" aria-valuemin="0" aria-valuemax="100" style="width:${project.statusPercent}%;">
                    ${project.statusPercent}
                </div>
              </div>

              <p class="description">
                Автор: ${project.captain.username}
                  ${project.dateOfLastUpdate}
              </p>

              <p>Описание:</p>
              <p class="article">
                  ${project.about}
              </p>


              <p><a href="/news?projectId=${project.id}">Новости проекта</a></p>

            </div>
          </div>

          <div class="col-xs-4 image hidden-xs hidden-sm">
            <img src="${contextPath}/resources/images/girl-w250.jpg" alt="girl" width="100%">
          </div>
        </div>

    </c:if>

<!-- /container -->

  <%@include file="footer.jsp" %>

  <script src="../../resources/js/jquery.min.js"></script>
  <script src="../../resources/js/jquery-3.1.1.slim.min.js"></script>
  <script>window.jQuery</script>
  <script src="../../resources/js/tether.min.js"></script>
  <script src="../../resources/bootstrap/js/bootstrap.js"></script>

</body>

</html>
