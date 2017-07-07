<%@page pageEncoding="UTF-8"%>
<%@include file="includes/aboveHtml.jsp"%>
<c:set var="title" value="Изменение личной информации ${user.username}"/>
<!doctype html>
<html>
<head>

    <title>${title}</title>
    <title>Изменить личную информацию</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/profile.css">
    <%@include file="includes/head.jsp"%>
</head>
<body>

<div id="leftSide">
</div>
<div id="rightSide">
</div>

<%@include file="includes/header.jsp" %>

<div class="container">
    <div class="row">
        <h4>Пользователи</h4>
        <div class="col-xs-12">
            <c:if test="${empty usersUnchecked}">
                Все зарегистрированные пользователи прошли модерацию
            </c:if>
            <c:if test="${!empty usersUnchecked}">
                Зарегистрированные пользователи, не прошедшие модерацию:<br>
                <c:forEach items="${usersUnchecked}" var="item">
                    <a href="/id${item.id}">${item.username}</a>,
                </c:forEach>
            </c:if>
        </div>
        <div class="col-xs-12">
            <c:if test="${empty usersChecked}">
                Нет пользователей, прошедших модерацию
            </c:if>
            <c:if test="${!empty usersChecked}">
                Зарегистрированные пользователи, прошедшие модерацию:<br>
                <c:forEach items="${usersChecked}" var="item">
                    <a href="/id${item.id}">${item.username}</a>,
                </c:forEach>
            </c:if>
        </div>
        <br><h4>Новости</h4>
        <div class="col-xs-12">
            <c:if test="${empty newsUnchecked}">
                Все новости прошли модерацию
            </c:if>
            <c:if test="${!empty newsUnchecked}">
                Новости, не прошедшие модерацию:<br>
                <c:forEach items="${newsUnchecked}" var="item">
                    <a href="/news-detailed?newsId=${item.id}">${item.name}</a>,
                </c:forEach>
            </c:if>
        </div>
        <div class="col-xs-12">
            <c:if test="${empty newsChecked}">
                Нет новостей, прошедших модерацию
            </c:if>
            <c:if test="${!empty newsChecked}">
                Новости, прошедшие модерацию:<br>
                <c:forEach items="${newsChecked}" var="item">
                    <a href="/news-detailed?newsId=${item.id}">${item.name}</a>,
                </c:forEach>
            </c:if>
        </div>
        <br><h4>Проекты</h4>
        <div class="col-xs-12">
            <c:if test="${empty projectsUnchecked}">
                Все проекты прошли модерацию
            </c:if>
            <c:if test="${!empty projectsUnchecked}">
                Проекты, не прошедшие модерацию:<br>
                <c:forEach items="${projectsUnchecked}" var="item">
                    <a href="/project-detailed?projectId=${item.id}">${item.name}</a>,
                </c:forEach>
            </c:if>
        </div>
        <div class="col-xs-12">
            <c:if test="${empty projectsChecked}">
                Нет проектов, прошедших модерацию
            </c:if>
            <c:if test="${!empty projectsChecked}">
                Проекты, прошедшие модерацию:<br>
                <c:forEach items="${projectsChecked}" var="item">
                    <a href="/project-detailed?projectId=${item.id}">${item.name}</a>,
                </c:forEach>
            </c:if>
        </div>
        <br><h4>Заказы</h4>
        <div class="col-xs-12">
            <c:if test="${empty ordersUnchecked}">
                Все проекты прошли модерацию
            </c:if>
            <c:if test="${!empty ordersUnchecked}">
                Проекты, не прошедшие модерацию:<br>
                <c:forEach items="${ordersUnchecked}" var="item">
                    <a href="/order-detailed?orderId=${item.id}">${item.name}</a>,
                </c:forEach>
            </c:if>
        </div>
        <div class="col-xs-12">
            <c:if test="${empty ordersChecked}">
                Нет проектов, прошедших модерацию
            </c:if>
            <c:if test="${!empty ordersChecked}">
                Проекты, прошедшие модерацию:<br>
                <c:forEach items="${ordersChecked}" var="item">
                    <a href="/order-detailed?orderId=${item.id}">${item.name}</a>,
                </c:forEach>
            </c:if>
        </div>
        <div class="col-xs-6">
            <button type="submit" class="btn btn-md btn-group" onclick="window.history.back()">
                Назад
            </button>
        </div>
    </div>
</div>



<%@include file="includes/footer.jsp" %>

</body>
</html>
