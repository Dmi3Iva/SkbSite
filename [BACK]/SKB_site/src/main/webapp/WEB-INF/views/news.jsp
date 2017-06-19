<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8"/>
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="${contextPath}/resources/images/logo.png">

    <title>СКБ</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/news.css">
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
        <div class="col-xs-6" >
            <ul class="titleHead">
                <li><div class="smallBlueBox"></div></li>
                <li><h3>
                    Новости
                    <c:if test="${!empty project}">
                        проекта <a href="/project-detailed?id=${project.id}">"${project.name}"</a>
                    </c:if>
                </h3></li>
            </ul>
        </div>
        <div class="col-xs-offset-1 col-xs-3 col-sm-offset-3 col-xs-3">
            <input type="button" class="btn btn-back btn-lg" onClick="self.location.href='/add-news';" value="Добавить новость">
        </div>
    </div>
    <!--Новости уровень 1-->

    <c:if test="${!empty newsList}">
        <c:forEach items="${newsList}" var="item">
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
                                <a href="/project-detailed?id=${newsProject.id}">${newsProject.name}</a>
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
                                        ${item.timeOfCreation}
                                    </c:if>
                                    <c:if test="${item.timeOfCreation != item.timeOfLastUpdate}">
                                    <c:if test="${item.editor.username != item.author.username}">
                                        Редактор: ${item.editor.username} <br>
                                    </c:if>
                                        <span class="glyphicon glyphicon-pencil"></span> Изменено ${item.timeOfLastUpdate}
                                    </c:if>
                                </p>
                            </li>
                            <div class="form-group">
                                <input type="button" class="btn btn-back btn-lg" onClick="self.location.href='/edit-news?newsId=${item.id}';" value="Редактировать">
                                <input type="button" class="btn btn-back btn-lg" onClick="(confirm('Вы уверены что хотите удалить новость?'))?self.location.href='/del-news?newsId=${item.id}':1/1;" value="Удалить">
                            </div>
                        </ul>
                    </div>
                </div>
                <div class="col-xs-4 image hidden-xs hidden-sm">
                    <img src="${item.photoPath}" alt="girl" width="100%">
                </div>
            </div>
            <br>
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

<c:choose>
    <c:when test="${empty newsList}">
        <%@include file="footer_absolute.jsp"%>
    </c:when>
    <c:when test="${!empty newsList}">
        <%@include file="footer.jsp"%>
    </c:when>
</c:choose>

  <script src="../../resources/js/jquery.min.js"></script>
  <script src="../../resources/js/jquery-3.1.1.slim.min.js"></script>
  <script>window.jQuery</script>
  <script src="../../resources/js/tether.min.js"></script>
  <script src="../../resources/bootstrap/js/bootstrap.js"></script>

</body>

</html>
