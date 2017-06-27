<%@page pageEncoding="UTF-8"%>
<%@include file="includes/aboveHtml.jsp"%>

<!doctype html>
<html lang="ru">

<head>
    <title>СКБ</title>
    <%@include file="includes/head.jsp"%>>
    <link rel="stylesheet" type="text/css" href="/resources/css/news-detailed.css">
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
        <sec:authorize access="hasRole('ROLE_ADMIN') or '${logUser.username == news.author.username}'">
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
                            <a href="/project-detailed?projectId=${newsProject.id}">${newsProject.name}</a>
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
                <sec:authorize access="hasRole('ROLE_ADMIN') or '${logUser.id == item.author.id}'">
                    <div class="form-group">
                        <form method="POST" action="/delete-comment" class="btn">
                            <input type="hidden" value="${news.id}" name="newsId"/>
                            <input type="hidden" value="${item.id}" name="commentId"/>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-back" onClick="(confirm('Вы уверены что хотите удалить комментарий?'))">Удалить</button>
                        </form>
                    </div>
                </sec:authorize>
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

    <sec:authorize access="isAuthenticated()">
        <div class="col-md-9">
          <div class="widget-area no-padding blank">
            <div class="status-upload">
              <form:form method="POST" modelAttribute="commentForm" class="form-horizontal">
                <spring:bind path="content">
                  <form:textarea path="content" placeholder="Ваш комментарий"/>
                  <form:errors path="content"/>
                </spring:bind>
                <spring:bind path="news.id">
                    <form:input path="news.id" value="${news.id}" cssStyle="visibility: hidden"/>
                </spring:bind>
                <button type="submit" class="btn btn-success green"><i class="fa fa-share"></i> Комментировать</button>
              </form:form>
            </div><!-- Status Upload  -->
          </div><!-- Widget Area -->
        </div>
    </sec:authorize>

    </c:if>
  </div>
<!-- /container -->

  <%@include file="includes/footer.jsp" %>
</body>

</html>
