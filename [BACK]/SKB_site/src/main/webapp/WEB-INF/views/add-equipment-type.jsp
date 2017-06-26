<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page pageEncoding="UTF-8"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:choose>
    <c:when test="${equipmentType.name != null}">
        <c:set var="title" value="Редактирование модели '${equipmentType.name}'"/>
    </c:when>
    <c:otherwise>
        <c:set var="title" value="Добавление модели"/>
    </c:otherwise>
</c:choose>


<html>
<head>
    <csrf disabled="true"/>
    <meta charset="utf-8" />
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="_csrf_parameter" content="_csrf" />
    <meta name="_csrf_header" content="X-CSRF-TOKEN" />
    <meta name="_csrf" content="e62835df-f1a0-49ea-bce7-bf96f998119c" />
    <link rel="icon" href="${contextPath}/resources/images/logo.png">

    <title>${title}</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/add-news.css">
    <%--TinyMCE Cloud deployment--%>
    <script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
    <script>tinymce.init({ selector:'textarea' });</script>
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
                        <c:choose>
                            <c:when test="${equipmentType.name != null}">
                                Редактирование модели
                            </c:when>
                            <c:otherwise>
                                Добавление модели
                            </c:otherwise>
                        </c:choose>
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
                                <form:textarea path="about" placeholder="Описание модели" class="form-control" id="equipmentTypeAbout"></form:textarea>
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
                                <form:textarea path="features" placeholder="Характеристики модели" class="form-control" id="equipmentTypeFeatures"></form:textarea>
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
