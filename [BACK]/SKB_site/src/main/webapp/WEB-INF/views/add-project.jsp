<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page pageEncoding="UTF-8"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <meta charset="utf-8" />
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="${contextPath}/resources/images/logo.png">

    <title>СКБ</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/add-news.css">
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
                    <h3>
                        <c:if test="${project.id > 0}">Изменение проект</c:if>
                        <c:if test="${empty project.id }"> Добавление проект</c:if>
                    </h3>
                </li>
            </ul>
        </div>
    </div>

    <form:form method="POST" modelAttribute="project" enctype="multipart/form-data" >
        <div class="col-xs-12">
            <div class="widget-area no-padding blank">
                <div class="status-upload">
                    <%--Название--%>
                    <div class="form-group">
                            <label class="control-label col-xs-3" for="projectName">Название проекта</label>
                            <spring:bind path="name">
                                <div class="col-xs-9">
                                    <form:input type="text" path="name" class="form-control" id="projectName" placeholder="Введите название проекта"></form:input>
                                    <form:errors path="name"></form:errors>
                                </div>
                            </spring:bind>
                    </div>
                        <c:if test="${isEditing == true}">
                            <%--Статус проекта--%>
                            <%--<div class="form-group">--%>
                                <%--<label class="control-label col-xs-3" for="projectStatus">Статус проекта</label>--%>
                                <%--<spring:bind path="projectStatus.id">--%>
                                    <%--<div class="col-xs-9" id="projectStatus">--%>
                                        <%--<form:checkbox path="projectStatus.id" value="1"/>Активен--%>
                                        <%--<form:checkbox path="projectStatus.id" value="2"/>Заморожен--%>
                                        <%--<form:checkbox path="projectStatus.id" value="3"/>Завершён--%>
                                    <%--</div>--%>
                                <%--</spring:bind>--%>
                            <%--</div>--%>
                            <%--Процент проекта--%>
                            <div class="form-group">
                                <label class="control-label col-xs-3" for="percent">Процент завершения</label>
                                <spring:bind path="statusPercent">
                                    <div class="col-xs-9">
                                        <form:input type="text" path="statusPercent" class="form-control" id="percent" placeholder="Процент завершения"></form:input>
                                        <form:errors path="name"></form:errors>
                                    </div>
                                </spring:bind>
                            </div>
                        </c:if>

                    <%--описание--%>
                    <div class="form-group">
                        <label class="control-label col-xs-3" for="about">Описание</label>
                        <spring:bind path="about">
                            <div class="col-xs-9">
                                <form:textarea path="about" id="about" placeholder="Опишите свой проект" class="form-control" ></form:textarea>
                                <form:errors path="about"></form:errors>
                                <c:if test="${project.id > 0}">
                                    <form:input  path="id"  value="${project.id}" cssStyle="visibility: hidden"></form:input>
                                </c:if>
                            </div>
                        </spring:bind>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3" for="newsPic">Загрузите картинку</label>
                        <input type="file" name="file" id="newsPic"  >
                    </div>
                    <div class="container">
                        <div class="col-xs-offset-9 col-xs-3">
                            <div class="form-group">
                                <c:if test="${project.id>0}">
                                    <button type="submit" formaction="/edit-project?${_csrf.parameterName}=${_csrf.token}" class="btn btn-success green"><i class="fa fa-share"></i>
                                        Изменить проект
                                    </button>
                                </c:if>
                                <c:if test="${empty project.id}">
                                    <button type="submit" formaction="/add-project?${_csrf.parameterName}=${_csrf.token}" class="btn btn-success green"><i class="fa fa-share"></i>
                                        Добавить проект
                                    </button>
                                </c:if>
                            </div>
                        </div>
                    </div>


                </div><!-- Status Upload  -->
            </div><!-- Widget Area -->
        </div>
    </form:form>
</div>


<!-- /container -->


<!--end contant-->
<%@include file="footer.jsp" %>

<script src="../../resources/js/jquery.min.js"></script>
<script src="../../resources/js/jquery-3.1.1.slim.min.js"></script>
<script>window.jQuery</script>
<script src="../../resources/js/tether.min.js"></script>
<script src="../../resources/bootstrap/js/bootstrap.js"></script>

</body>
</html>
