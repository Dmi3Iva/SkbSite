<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page pageEncoding="UTF-8"%>

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
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/news-detailed.css">
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
      <div class="col-md-8">
        <ul class="titleHead">
          <li>
            <div class="smallBlueBox"></div>
          </li>
          <li>
            <h3>Новость "${news.name}"</h3></li>
        </ul>
      </div>
    </div>
    <!--IIMAGE 1-->
    <c:if test = "${!empty news}">
        <sec:authorize access="hasRole('ROLE_ADMIN') or '${!empty logUser}'">
            <div class="form-group">
                <input type="button" class="btn btn-back btn-lg" onClick="self.location.href='/edit-news?newsId=${news.id}';" value="Редактировать">
                <form method="POST" action="/delete-news" class="btn">
                    <input type="hidden" value="${news.id}" name="newsId"/>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-back btn-lg" onClick="(confirm('Вы уверены что хотите удалить новость?'))">Удалить</button>
                </form>
            </div>
        </sec:authorize>
        <c:set var="newsProject" value="${news.project}"/>
        <div class="row">
            <div class="col-xs-12 image"><img src="${news.photoPath}" alt="${news.name} Картинка" width="100%"></div></div>
        <div class="row ">
            <div class="col-xs-12">

                <div class="new">

                    <p class="title">
                            ${news.name}
                    </p>
                    <p>
                        <c:if test="${newsProject != null}">
                            Проект:
                            <a href="/project-detailed?id=${newsProject.id}">${newsProject.name}</a>
                        </c:if>
                    </p>
                    <p class="article">
                            ${news.content}
                    </p>


                    <p class="description">
                        Автор: <a href="/id${news.author.id}">${news.author.username}</a><br>
                        <c:if test="${news.timeOfCreation == news.timeOfLastUpdate}">
                            ${news.timeOfCreation}
                        </c:if>
                        <c:if test="${news.timeOfCreation != news.timeOfLastUpdate}">
                            <c:if test="${news.editor.username!= news.author.username}">
                                Редактор: <a href="/id${news.author.id}">${news.editor.username}</a> <br>
                            </c:if>
                            <span class="glyphicon glyphicon-pencil"></span> Изменено ${news.timeOfLastUpdate}
                        </c:if>
                    </p>

                </div>
            </div>

        </div>
      <div class="row">
        <div class="col-md-12">
          <h3>Комментарии(${commentsForCurrentNews.size()})</h3>
        </div>
      </div>
      <%--<c:if test="${!empty comments}">--%>
      <c:forEach items="${commentsForCurrentNews}" var="item">
        <div class="row">
          <div class="col-sm-1">
            <div class="thumbnail">
              <img class="img-responsive user-photo" src="${contextPath}/resources/images/${item.author.photoPath}">
            </div>
            <!-- /thumbnail -->
          </div>
          <!-- /col-sm-1 -->

          <div class="col-sm-8">
            <div class="panel panel-default">
              <div class="panel-heading">
                  <strong><a href="/id${item.author.id}">${item.author.username}</a></strong> <span class="text-muted">добавлено ${item.timeOfCreation}</span>
              </div>
              <div class="panel-body">
                  ${item.content}
              </div>
              <!-- /panel-body -->
            </div>
            <!-- /panel panel-default -->
          </div>
          <!-- /col-sm-5 -->
        </div>
      </c:forEach>

      <c:if test="${pageContext.request.userPrincipal.name != null}">
        <div class="col-md-9">
          <div class="widget-area no-padding blank">
            <div class="status-upload">
              <form:form method="POST" modelAttribute="commentForm" class="form-horizontal">
                <spring:bind path="content">
                  <form:textarea path="content" placeholder="Ваш комментарий"/>
                  <form:errors path="content"/>
                </spring:bind>
                <button type="submit" class="btn btn-success green"><i class="fa fa-share"></i> Комментировать</button>
              </form:form>
            </div><!-- Status Upload  -->
          </div><!-- Widget Area -->
        </div>
      </c:if>

    </c:if>
  </div>
<!-- /container -->






  <%@include file="footer.jsp" %>

  <script src="../../resources/js/jquery.min.js"></script>
  <script src="../../resources/js/jquery-3.1.1.slim.min.js"></script>
  <script>window.jQuery</script>
  <script src="../../resources/js/tether.min.js"></script>
  <script src="../../resources/bootstrap/js/bootstrap.js"></script>

</body>

</html>
