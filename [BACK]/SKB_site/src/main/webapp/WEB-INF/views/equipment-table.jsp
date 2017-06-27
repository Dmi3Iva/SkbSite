<%@page pageEncoding="UTF-8"%>
<%@include file="includes/aboveHtml.jsp"%>
<!doctype html>
<html lang="ru">

<head>
    <title>СКБ</title>
    <%@include file="includes/head.jsp"%>
    <link rel="stylesheet" type="text/css" href="/resources/css/equipment-table.css">
</head>
<body>

<main class="container-fluid">
    <H1>Таблица устройств модели ${equipmentType.name}</H1>
    <c:if test="${empty equipmentSet}">
        <h2>Не добавлено ни одно устройство.</h2>
    </c:if>
    <c:if test="${!empty equipmentSet}">
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>UN устройства</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${equipmentSet}" var="item">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.uniqueNumber}</td>
                        <td>
                            <form action="/edit-equipment-table" method="post" name="equipmentEdit" class="form-inline">
                                <div class="form-group">
                                    <input type="hidden" name="idEquip" value="${item.id}"/>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <input type="text" class="form-control" name="uniqueNumber">
                                    <button type="submit" class="btn btn-success">Изменить UN</button>
                                </div>
                            </form>
                        </td>
                        <td>
                            <form action="/del-equipment-table" method="post" name="equipmentDelete" class="form-inline">
                                <div class="form-group">
                                    <input type="hidden" name="idEquip" value="${item.id}"/>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <button type="submit" class="btn btn-default">Удалить устройство</button>
                                </div>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>


        <form:form method="POST" modelAttribute="equipment" class="form-inline">

            <div class="form-group">
                <label for="equipmentNumber">UN нового устройства</label>
                <spring:bind path="uniqueNumber">
                        <form:input type = "text" path="uniqueNumber" placeholder="идентификационый номер модели" class="form-control" id="equipmentNumber"></form:input>
                        <form:errors path="uniqueNumber"></form:errors>
                </spring:bind>
                <button type="submit" class="btn btn-primary">Добавить новое устройство</button>
            </div>

        </form:form>

    <div class="row">
        <div class="col-xs-2">
            <a role="button" class="btn btn-default" href="/equipment-type-detailed?id=${equipmentType.id}">
                Назад
            </a>
        </div>
    </div>
</main>

</body>
</html>
