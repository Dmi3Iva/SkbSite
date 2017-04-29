<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Registration</title>
</head>
<body>
    <form:form method="POST" modelAttribute="userForm">
        <spring:bind path="name">
            <form:input type="text" path="name" placeholder="Username"
                        autofocus="true"></form:input>
            <form:errors path="name"></form:errors>
        </spring:bind>

        <spring:bind path="password">
            <form:input type="password" path="password" placeholder="Password"></form:input>
            <form:errors path="password"></form:errors>
        </spring:bind>

        <spring:bind path="passwordConfirm">
            <form:input type="password" path="passwordConfirm"
                        placeholder="Confirm your password"></form:input>
            <form:errors path="passwordConfirm"></form:errors>
        </spring:bind>

        <button type="submit">Submit</button>
    </form:form>



</body>
</html>
