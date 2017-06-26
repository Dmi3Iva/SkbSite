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
    <meta charset="utf-8"/>
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="${contextPath}/resources/images/logo.png">

    <title>СКБ</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/about.css">



    <!-- include libraries(jQuery, bootstrap) -->

    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>

    <!-- include summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.4/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.4/summernote.js"></script>
</head>
<body>

<div id="leftSide">
</div>
<div id="rightSide">
</div>

<%@include file="header.jsp" %>

<div class="container content">
    <div class="row">
        <!--Новости раздел-->
        <div class="col-xs-6" >
            <ul class="titleHead">
                <li><div class="smallBlueBox"></div></li>
                <li><h3>О нас</h3></li>
            </ul>
        </div>
        <%--<sec:authorize access="hasRole('ROLE_ADMIN')">--%>
        <div class="col-xs-offset-1 col-xs-3 col-sm-offset-3 col-xs-3">
            <button type="button" class="btn btn-back btn-lg" data-toggle="modal" data-target = #myModal>
                Редактировать
            </button>
        </div>

        <div class="modal fade " id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                    </div>
                    <form:form modelAttribute="aboutPage" method="post">
                    <div class="modal-body">

                            <spring:bind path="id">
                                <form:hidden path="id"/>
                            </spring:bind>
                            <spring:bind path="text">
                                <form:textarea path="text" id="summernote"/>
                            </spring:bind>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </div>
                    </form:form>
                </div>
            </div>
        </div>

        <%--</sec:authorize>--%>
    </div>

    <div class="row">
        <div class="col-xs-12">
            ${aboutPage.text}
        </div>
        <div id="summernoteR"></div>
    </div>
    <div id="summernote"><p>Hello Summernote</p></div>
    <script>
    $(document).ready(function() {
        $('#summernote').summernote();
    });
    </script>
</div>


    <%@include file="footer.jsp" %>

    <script src="../../resources/js/jquery.min.js"></script>
    <script src="../../resources/js/jquery-3.1.1.slim.min.js"></script>
    <script>window.jQuery</script>
    <script src="../../resources/js/tether.min.js"></script>
    <script src="../../resources/bootstrap/js/bootstrap.js"></script>

</body>

</html>
