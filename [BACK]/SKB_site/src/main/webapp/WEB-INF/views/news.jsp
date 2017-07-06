<%@page pageEncoding="UTF-8"%>
<%@include file="includes/aboveHtml.jsp"%>
<c:choose>
    <c:when test="${project == null}">
        <c:set var="title" value="Новости"/>
    </c:when>
    <c:otherwise>
        <c:set var="title" value="Новости проекта '${project.name}'"/>
    </c:otherwise>
</c:choose>


<!doctype html>
<html lang="ru">
<head>
    <%@include file="includes/head.jsp"%>
    <link rel="stylesheet" type="text/css" href="/resources/css/news.css">
    <title>${title}</title>
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
        <c:choose>
            <c:when test="${!empty project}">
                <div class="col-xs-6" >
                    <ul class="titleHead">
                        <li><div class="smallBlueBox"></div></li>
                        <li><h3>
                            Новости проекта <a href="/project-detailed?projectId=${project.id}">"${project.name}"</a>
                        </h3></li>
                    </ul>
                </div>
                <sec:authorize access="hasRole('ROLE_ADMIN') or hasRole('ROLE_MODERATOR') or '${logUser.username == project.captain.username}'">
                    <div class="col-xs-offset-1 col-xs-3 col-sm-offset-3 col-xs-3">
                        <input type="button" class="btn btn-back btn-lg" onClick="self.location.href='/add-news?projectId=${project.id}';" value="Добавить новость">
                    </div>
                </sec:authorize>
            </c:when>
            <c:when test="${empty project}">
                <div class="col-xs-6" >
                    <ul class="titleHead">
                        <li><div class="smallBlueBox"></div></li>
                        <li><h3>
                            Новости
                        </h3></li>
                    </ul>
                </div>
                <sec:authorize access="hasRole('ROLE_ADMIN') or hasRole('ROLE_MODERATOR') or (hasRole('ROLE_MEMBER') and '${logUser.checked == true}')">
                    <div class="col-xs-offset-1 col-xs-3 col-sm-offset-3 col-xs-3">
                        <input type="button" class="btn btn-back btn-lg" onClick="self.location.href='/add-news';" value="Добавить новость">
                    </div>
                </sec:authorize>
            </c:when>
        </c:choose>
    </div>
    <!--Новости уровень 1-->

    <c:if test="${!empty newsList}">
        <c:forEach items="${newsList}" var="item">
            <c:if test="${(item.checked) or ((!item.checked) and ((logUser.username == item.author.username) or (logUser.role.id == 3) or (logUser.role.id == 4)))}">
                <c:set var="newsProject" value="${item.project}"/>
                <div class="row">
                    <div class="col-md-8">
                        <div class="new">
                            <p class="title">
                                <a href="/news-detailed?newsId=${item.id}">${item.name}</a>
                            </p>
                            <p>
                                <c:if test="${newsProject != null}">
                                    Проект:
                                    <a href="/project-detailed?projectId=${newsProject.id}">${newsProject.name}</a>
                                </c:if>
                            </p>
                            <p class="article">
                                    ${item.content}
                            </p>
                            <ul class="detailes">
                                <li>
                                    <a href="/news-detailed?newsId=${item.id}">Подробнее...</a>
                                </li>
                                <li>
                                    <p class="description">
                                        Автор: <a href="/id${item.author.id}">${item.author.username}</a><br>
                                        <c:if test="${item.timeOfCreation == item.timeOfLastUpdate}">
                                            <span class="glyphicon glyphicon-plus"></span>Добавлено ${item.timeOfCreation}
                                        </c:if>
                                        <c:if test="${item.timeOfCreation != item.timeOfLastUpdate}">
                                            <c:if test="${item.editor.username != item.author.username}">
                                                Редактор: <a href="/id${item.editor.id}">${item.editor.username}</a><br>
                                            </c:if>
                                            <span class="glyphicon glyphicon-pencil"></span> Изменено ${item.timeOfLastUpdate}
                                        </c:if>
                                    </p>
                                </li>
                                <sec:authorize access="hasRole('ROLE_ADMIN') or hasRole('ROLE_MODERATOR') or '${logUser.username == item.author.username}'">
                                    <div class="form-group">
                                        <input type="button" class="btn btn-back btn-lg" onClick="self.location.href='/edit-news?newsId=${item.id}';" value="Редактировать">
                                        <form method="POST" action="/delete-news" class="btn">
                                            <input type="hidden" value="${item.id}" name="newsId"/>
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                            <button type="submit" class="btn btn-back btn-lg" onClick="(confirm('Вы уверены что хотите удалить новость?'))">Удалить</button>
                                        </form>
                                    </div>
                                </sec:authorize>
                            </ul>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </c:if>
    <c:if test="${empty newsList}">
        <div class="empty-list">
            <h2>
                К сожалению список новостей пуст <br>
                :(
            </h2>
        </div>
    </c:if>
</div>

<%@include file="includes/footer.jsp"%>

</body>

</html>
