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

    <div class="personal_header col-sm-offset-3">
        <h1>${title}</h1>
    </div>

    <div class="row">
        <div class="table-header">
            <p class="col-xs-offset-2 col-xs-1">Устройство</p>
            <p class="col-xs-offset-1 col-xs-1">UN</p>
            <p class="col-xs-offset-1 col-xs-1">День</p>
            <p class="col-xs-offset-1 col-xs-2">Время</p>
        </div>
    </div>
    <c:forEach items="${bookingsGroupedByRequest}" var="bookings">
        <c:forEach items="${bookings}" var="booking">
            <div class="row">
                <p class="col-xs-offset-2 col-xs-1">${booking.equipment.equipmentType.name}</p>
                <p class="col-xs-offset-1 col-xs-1">${booking.equipment.uniqueNumber}</p>
                <p class="col-xs-offset-1 col-xs-1">${booking.day}</p>
                <p class="col-xs-offset-1 col-xs-2">${booking.timeString}</p>
            </div>
        </c:forEach>
    </c:forEach>

    <%@include file="includes/footer.jsp" %>
</body>
</html>
