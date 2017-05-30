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
      <div class="col-md-6">
        <ul class="titleHead">
          <li>
            <div class="smallBlueBox"></div>
          </li>
          <li>
            <h3>Проекты</h3></li>
        </ul>
      </div>
        <div class="col-xs-offset-1 col-xs-3 col-sm-offset-3 col-xs-3">
            <input type="button" class="btn btn-back btn-lg" onClick="self.location.href='/add-project';" value="Добавить проект">
        </div>
    </div>
    <!--Новости уровень 1-->

    <c:if test="${!empty projectsList}">
      <c:forEach items="${projectsList}" var="item">
        <div class="row">
          <div class="col-md-8">
            <div class="new">
              <p class="title">
                  ${item.name}
              </p>
              <p>Капитан:
                ${item.captain.username}
              </p>
              <p>Статус проекта: ${item.projectStatus.name}</p>
              <div class="progress">
                <div class="progress-bar" role="progressbar" aria-valuenow="${item.statusPercent}" aria-valuemin="0" aria-valuemax="100" style="width: ${item.statusPercent}%;">
                  ${item.statusPercent}
                </div>
              </div>

                  <p class="description">
                      Дата начала: ${item.dateOfStart}
                      <c:if  test="${item.dateOfLastUpdate != item.dateOfStart} ">
                        Последнее обновление: ${item.dateOfLastUpdate}
                      </c:if>
                  </p>

              <p>Описание:</p>

              <p class="article">
                ${item.about}
              </p>
                  <a href="/project-detailed?id=${item.id}">Подробнее...</a>
                <div class="form-group">
                  <input type="button" class="btn btn-back btn-lg" onClick="self.location.href='/edit-project?id=${item.id}';" value="Редактировать">
                  <input type="button" class="btn btn-back btn-lg" onClick="(confirm('Вы уверены что хотите удалить проект?'))?self.location.href='/del-project?id=${item.id}':1/1;" value="Удалить">
                </div>
              </ul>
            </div>
          </div>

          <div class="col-xs-4 image hidden-xs hidden-sm">
            <img src="${item.photoPath}" alt="${item.name} Picture" width="100%">
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

  <%@include file="footer.jsp" %>

  <script src="../../resources/js/jquery.min.js"></script>
  <script src="../../resources/js/jquery-3.1.1.slim.min.js"></script>
  <script>window.jQuery</script>
  <script src="../../resources/js/tether.min.js"></script>
  <script src="../../resources/bootstrap/js/bootstrap.js"></script>

</body>

</html>
