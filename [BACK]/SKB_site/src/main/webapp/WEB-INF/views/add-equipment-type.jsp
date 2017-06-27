<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var = "userPrincipal" value = "${pageContext.request.userPrincipal}"/>
<%@page pageEncoding="UTF-8"%>

<html>
<head>
    <title>СКБ</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/add-news.css">
    <%@include file="includes/head.jsp"%>
    <%@include file="includes/summernoteLinksScrtipts.jsp"%>
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
        <div class="col-md-6">
            <ul class="titleHead">
                <li>
                    <div class="smallBlueBox"></div>
                </li>
                <li>
                    <h3>
                        <c:if test="${equipmentType.id > 0}">Изменение модели</c:if>
                        <c:if test="${empty equipmentType.id }"> Добавление модели</c:if>
                    </h3>
                </li>
            </ul>
        </div>
    </div>


    <form:form method="POST" modelAttribute="equipmentType" enctype="multipart/form-data" >

        <div class="col-xs-12">
            <div class="widget-area no-padding blank">
                <div class="status-upload">
                    <div class="form-group">
                        <label class="control-label col-xs-3" for="equipmentTypeName">Название модели</label>
                        <spring:bind path="name">
                            <div class="col-xs-9">
                                <form:input type="text" path="name" class="form-control" id="equipmentTypeName" placeholder="Введите название модели"></form:input>
                                <form:errors path="name"></form:errors>
                            </div>
                        </spring:bind>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3" for="equipmentTypeAbout">Описание модели</label>
                        <spring:bind path="about">
                            <div class="col-xs-9">
                                <form:textarea path="about" placeholder="Описание модели" class="form-control summernote-editor" id="equipmentTypeAbout"></form:textarea>
                                <form:errors path="about"></form:errors>
                                <c:if test="${equipmentType.id > 0}">
                                    <form:input  path="id"  value="${equipmentType.id}" cssStyle="visibility: hidden"></form:input>
                                </c:if>
                            </div>
                        </spring:bind>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3" for="equipmentTypeFeatures">Характеристики модели</label>
                        <spring:bind path="features">
                            <div class="col-xs-9">
                                <form:textarea path="features" placeholder="Характеристики модели" class="form-control summernote-editor" id="equipmentTypeFeatures"></form:textarea>
                                <form:errors path="features"></form:errors>
                                <c:if test="${equipmentType.id > 0}">
                                    <form:input  path="id"  value="${equipmentType.id}" cssStyle="visibility: hidden"></form:input>
                                </c:if>
                            </div>
                        </spring:bind>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3" for="equipmentTypePic">Загрузите картинку</label>
                        <input type="file" name="file" id="equipmentTypePic"  >

                    </div>
                    <div class="container">
                        <div class="col-xs-offset-9 col-xs-3">
                            <div class="form-group">
                                <c:if test="${ empty equipmentType.id }">
                                    <button type="submit" formaction="/add-equipment-type?${_csrf.parameterName}=${_csrf.token}" class="btn btn-success green"><i class="fa fa-share"></i>
                                        Добавить модель
                                    </button>
                                </c:if>
                                <c:if test="${equipmentType.id > 0}">
                                    <button type="submit" formaction="/edit-equipment-type?${_csrf.parameterName}=${_csrf.token}" class="btn btn-success green"><i class="fa fa-share"></i>
                                        Изменить модель
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
<%@include file="includes/footer.jsp" %>
</body>
</html>
