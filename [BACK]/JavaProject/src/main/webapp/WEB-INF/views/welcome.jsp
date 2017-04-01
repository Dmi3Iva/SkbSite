<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="imageSource" value="${contextPath}/resources/images"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Welcome</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/welcome.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</head>
<body>
<script type="text/javascript">
    function UpdateCurrentUser() {
        $.ajax({
            url : 'welcome/getPhotoPath',
            type: 'GET',

            success: function (data) {
                $("#newUserImage").attr("src", "${imageSource}/" + data);
                alert(data);
            }
        });
    }
    //функция, для обновления всех пользователей
    /*function UpdateAll() {
        var table=document.getElementById("tableUser");
        var row = document.getElementById('tableUser').getElementsByTagName('tr');
        var column = document.getElementById('tableUser').getElementsByTagName('td');
        $.ajax({
            url : 'welcome/fake',
            type: 'GET',
            success: function (data) {
                var i = 0;
                while (i < row.length){
                    table[i][2].attr("src", "{imageSource}/" + data[i]);
                    i++;
                }
                UpdateCurrentUser();
                alert(data);
            }
       });
    }*/
</script>
<div class="container">

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>

        <!--Отображаем фотку пользователя-->
        <img id="newUserImage" class="userImage" src="${imageSource}/${photoPath}" alt="Photo must be here"/>
    </c:if>
    <input type="button" value="Update image" onclick="UpdateCurrentUser()">
    <br><br>

    ${stringUserList}


    <!--ТАБЛИЦА-->
    <c:if test="${!empty userList}">
        <table id="tableUser">
            <tr>
                <th>Name</th>
                <th>Id</th>
                <th>Password</th>
                <th>Photo</th>
            </tr>

            <c:forEach items="${userList}" var="item">
                <tr>
                    <td>${item.username}</td>
                    <td>${item.id}</td>
                    <td>${item.password}</td>
                    <td><img class="userImage" src="${imageSource}/${item.photoPath}"> </td>
                </tr>
            </c:forEach>

        </table>

    </c:if>

</div>
</body>
</html>
