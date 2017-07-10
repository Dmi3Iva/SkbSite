<%@page pageEncoding="UTF-8"%>
<%@include file="includes/aboveHtml.jsp"%>
<!doctype html>
<c:choose>
    <c:when test="${news.name != null}">
        <c:set var="title" value="Редактирование новости '${news.name}'"/>
    </c:when>
    <c:otherwise>
        <c:set var="title" value="Добавление новости"/>
    </c:otherwise>
</c:choose>
<html>
<head>

    <title>${title}</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/add-news.css">
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
                        <c:choose>
                            <c:when test="${news.name != null}">
                                Редактирование новости
                            </c:when>
                            <c:otherwise>
                                Добавление новости
                            </c:otherwise>
                        </c:choose>
                    </h3>
                </li>
            </ul>
        </div>
    </div>

    <form:form method="POST" modelAttribute="news" enctype="multipart/form-data">
        <div class="col-xs-12">
            <div class="widget-area no-padding blank">
                <div class="status-upload">
                    <div class="form-group content-shell">
                        <label class="control-label col-xs-3 " for="newsName">Название новости</label>
                        <spring:bind path="name">
                            <div class="col-xs-9">
                                <form:input type="text" path="name" class="form-control" id="newsName" placeholder="Введите название новости" maxlength="35"></form:input>
                                <form:errors path="name"></form:errors>
                            </div>
                        </spring:bind>
                    </div>
                    <c:if test="${news.project != null}">
                        <form:input path="project.id" value="${news.project.id}" cssStyle="visibility: hidden"/>
                    </c:if>
                    <div class="form-group content-shell">
                        <label class="control-label col-xs-3" for="newsContent">Содержание новости</label>
                        <spring:bind path="content">
                            <div class="col-xs-9">
                                <form:textarea path="content" placeholder="Содержание новости" class="form-control summernote-editor" id="newsContent"></form:textarea>
                                <form:errors path="content"></form:errors>
                                <c:if test="${news.id > 0}">
                                    <form:input class="form-control" path="id"  value="${news.id}" cssStyle="visibility: hidden"></form:input>
                                </c:if>
                            </div>
                        </spring:bind>
                    </div>
                    <c:if test="${news.name != null && !news.checked}">
                        <div class="form-group content-shell">
                            <spring:bind path="checked">
                                <div class="form-check">
                                    <label class="control-label col-xs-5">Модерация</label>
                                    <label class="control-label form-check-label col-xs-1 col-xs-offset-6 text-left">
                                        <form:checkbox path="checked" class="control-label"/>
                                        <form:errors path="checked"/>
                                    </label>
                                </div>
                            </spring:bind>
                        </div>
                    </c:if>
                    <div class="container">
                        <div class="col-xs-offset-6 col-xs-6 col-md-offset-8 col-md-4 col-sm-offset-7 col-sm-5">
                            <div class="form-group">
                                <c:if test="${empty news.id}">
                                    <button type="submit" formaction="/add-news?${_csrf.parameterName}=${_csrf.token}" class="btn btn-success green "><i class="fa fa-share"></i>
                                        Добавить новость
                                    </button>
                                </c:if>
                                <c:if test="${news.id > 0}">
                                    <button type="submit" formaction="/edit-news?${_csrf.parameterName}=${_csrf.token}" class="btn btn-success green btn-sm"><i class="fa fa-share"></i>
                                        Изменить новость
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
