<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
      <div class="col-md-6">
        <ul class="titleHead">
          <li>
            <div class="smallBlueBox"></div>
          </li>
          <li>
            <h3>Новости</h3></li>
        </ul>
      </div>
    </div>
    <!--IIMAGE 1-->
    <c:if test = "${!empty news}">
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
                        Автор: ${news.author.username}<br>
                        <c:if test="${news.timeOfCreation == news.timeOfLastUpdate}">
                            ${news.timeOfCreation}
                        </c:if>
                        <c:if test="${news.timeOfCreation != news.timeOfLastUpdate}">
                            <c:if test="${news.editor.username!= news.author.username}">
                                Редактор: ${news.editor.username} <br>
                            </c:if>
                            <span class="glyphicon glyphicon-pencil"></span> Изменено ${news.timeOfLastUpdate}
                        </c:if>
                    </p>

                </div>
            </div>

        </div>
      <div class="row">
        <div class="col-md-12">
          <h3>Комментарии()</h3>
        </div>
      </div>
      <%--<c:if test="${!empty comments}">--%>
      <c:forEach items="${news.comments}" var="item">
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
                <strong>${item.author.username}</strong> <span class="text-muted">добавлено ${item.timeOfCreation}</span>
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
                  <form:textarea path="content" placeholder="Пожалуйста, ничего не пиши сюда"/>
                  <form:errors path="content"/>
                  <%--<ul>--%>
                  <%--<li><a title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Audio"><i class="fa fa-music"></i></a></li>--%>
                  <%--<li><a title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Video"><i class="fa fa-video-camera"></i></a></li>--%>
                  <%--<li><a title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Sound Record"><i class="fa fa-microphone"></i></a></li>--%>
                  <%--<li><a title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Picture"><i class="fa fa-picture-o"></i></a></li>--%>
                  <%--</ul>--%>
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
