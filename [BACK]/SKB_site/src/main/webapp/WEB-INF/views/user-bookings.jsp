<%@page pageEncoding="UTF-8"%>
<%@include file="includes/aboveHtml.jsp"%>

<c:set var="title" value="Бронирования пользователя ${user.username}"/>

<!doctype html>
<html lang="ru">
<head>
    <title>${title}</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/user-bookings.css">
</head>
<body>
    <div id="leftSide"></div>
    <div id="rightSide"></div>

    <%@include file="includes/header.jsp" %>

    <div class="user-booking-title col-sm-offset-3">
        <h1>${title}</h1>
    </div>

    <div class="row">
        <div class="col-xs-offset-2 col-xs-8">
            <table class="table table-striped">
                <tbody>
                    <tr>
                        <th>Устройство</th>
                        <th>UN</th>
                        <th>День</th>
                        <th>Время</th>
                        <th></th>
                    </tr>
                    <c:forEach items="${bookingsGroupedByRequest}" var="bookings">
                        <c:forEach items="${bookings}" var="booking">
                            <tr>
                                <td><a href="/equipment-type-detailed?id=${booking.equipment.equipmentType.id}">${booking.equipment.equipmentType.name}</a></td>
                                <td>${booking.equipment.uniqueNumber}</td>
                                <td>${booking.day}</td>
                                <td>${booking.timeString}</td>
                                <td>
                                    <form method="POST" action="/delete-booking">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <input type="hidden" name="userId" value="${user.id}"/>
                                        <input type="hidden" name="bookingId" value="${booking.id}"/>
                                        <button type="submit" class="btn btn-default btn-sm" onclick='return confirm("Вы действительно хотите удалить эту бронь?")'>Удалить</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">

    </div>
    <div class="row col-xs-offset-2 btn-group btn">
        <button type="submit" class="btn btn-primary btn-lg" onclick="window.history.back()">
            Назад
        </button>
    </div>

    <%@include file="includes/footer.jsp" %>
</body>
</html>
