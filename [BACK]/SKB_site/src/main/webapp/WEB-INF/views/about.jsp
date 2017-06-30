<%@page pageEncoding="UTF-8"%>
<%@include file="includes/aboveHtml.jsp"%>
<c:set var="title" value="О нас"/>
<!doctype html>
<html lang="ru">
<head>


    <title>${title}</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/about.css">
    <%@include file="includes/head.jsp"%>
    <%@include file="includes/summernoteLinksScrtipts.jsp"%>
    <script>
        $(document).ready(
            function () {
                $("#about-toggle-button").click(function () {
                    $(".about-toggle").toggle("slow");
                })
            }
        )
    </script>
</head>
<body>

<div id="leftSide">
</div>
<div id="rightSide">
</div>

<%@include file="includes/header.jsp" %>

<div class="container content">
    <div class="row">
        <!--Новости раздел-->
        <div class="col-xs-6" >
            <ul class="titleHead">
                <li><div class="smallBlueBox"></div></li>
                <li><h3>${title}</h3></li>
            </ul>
        </div>
        <%--<sec:authorize access="hasRole('ROLE_ADMIN')">--%>
        <div class="col-xs-offset-1 col-xs-3 col-sm-offset-3 col-xs-3">
            <button type="button" class="btn btn-back btn-lg" id="about-toggle-button">
                Редактировать
            </button>
        </div>

        <div class="row about-toggle" style="display: none">
            <div class="col-xs-12">
                <form:form modelAttribute="aboutPage" method="post" action="/about?${_csrf.parameterName}=${_csrf.token}">
                        <spring:bind path="id">
                            <form:hidden path="id"/>
                        </spring:bind>
                        <spring:bind path="text">
                            <form:textarea path="text" class="summernote-editor"/>
                        </spring:bind>
                    <div class="col-xs-3 col-xs-offset-9">
                        <button type="submit" class="btn btn-primary">Сохранить изменения</button>
                    </div>
                </form:form>
            </div>
        </div>
        <%--</sec:authorize>--%>
    </div>

    <div class="row about-toggle" >
        <div class="col-xs-12">
            ${aboutPage.text}
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp" %>

</body>
</html>
