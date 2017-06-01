<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page pageEncoding="UTF-8"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

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

    <title>СКБ</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/add-order.css">

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
                        <c:if test="${order.id > 0}">Изменение заказа</c:if>
                        <c:if test="${empty order.id }"> Добавление заказа</c:if>
                    </h3>
                </li>
            </ul>
        </div>
    </div>


    <form:form method="POST" modelAttribute="order" enctype="multipart/form-data" >

        <div class="col-xs-12">
            <div class="widget-area no-padding blank">
                <div class="status-upload">
                    <div class="form-group">
                        <label class="control-label col-xs-3" for="orderName">Название заказа</label>
                        <spring:bind path="name">
                            <div class="col-xs-9">
                                <form:input type="text" path="name" class="form-control" id="orderName" placeholder="Введите название заказа"></form:input>
                                <form:errors path="name"></form:errors>
                            </div>
                        </spring:bind>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3" for="orderContent">Содержание заказа</label>
                        <spring:bind path="content">
                            <div class="col-xs-9">
                                <form:textarea path="content" placeholder="Содержание заказа" class="form-control" id="orderContent"></form:textarea>
                                <form:errors path="content"></form:errors>
                                <c:if test="${order.id > 0}">
                                    <form:input  path="id"  value="${order.id}" cssStyle="visibility: hidden"></form:input>
                                </c:if>
                            </div>

                        </spring:bind>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Проект, к которому привязан заказ</label>
                        <form:select path="project.id">
                            <form:option value="-1" selected="selected">Отсутствует</form:option>
                            <form:options items="${allProjects}" itemLabel="name" itemValue="id"></form:options>
                        </form:select>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3" for="orderPic">Загрузите картинку</label>
                        <input type="file" name="file" id="orderPic"  >

                    </div>
                    <div class="container">
                        <div class="col-xs-offset-9 col-xs-3">
                            <div class="form-group">
                                <c:if test="${ empty order.id }">
                                    <button type="submit" formaction="/add-order?${_csrf.parameterName}=${_csrf.token}" class="btn btn-success green"><i class="fa fa-share"></i>
                                        Добавить заказ
                                    </button>
                                </c:if>
                                <c:if test="${order.id > 0}">
                                    <button type="submit" formaction="/edit-order?${_csrf.parameterName}=${_csrf.token}" class="btn btn-success green"><i class="fa fa-share"></i>
                                        Изменить заказ
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
