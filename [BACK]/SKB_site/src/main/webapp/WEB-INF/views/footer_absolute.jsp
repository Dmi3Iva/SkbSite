<%@page pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!doctype html>
<html>
<head>
    <link href="${contextPath}/resources/css/footer.css" rel="stylesheet">
</head>
<body>
<footer class="navbar-fixed-bottom">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="col-xs-6">
                    <ul class="list-unstyled">
                        <li><a href="/news">Новости</a></li>
                        <li><a href="/equipment">Оборудование</a></li>
                        <li><a href="/projects">Проекты</a></li>
                        <li><a href="/order">Заказы</a></li>
                        <li><a href="/about">О нас</a></li>
                    </ul>
                </div>
                <div class="col-xs-6">
                    <ul class="list-unstyled text-right">
                        <li>Мы в социальных сетях<li>
                        <li class="socialIcons text-right">
                            <a href="https://vk.com/bfu_skb"><img src="${contextPath}/resources/images/vk.png" alt="Vkontakte">
                            </a>
                            <a href="https://instagram.com"><img src="${contextPath}/resources/images/instagram.png" alt="Instagram"></a>
                            <a href="https://twitter.com"><img src="${contextPath}/resources/images/twitter.png" alt="Twitter"></a>
                        </li>
                        <li><br></li>
                        <li>Copyright &copy 2017</li>
                        <li>Сайт разработала команда TRIP</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer>
</body>
</html>
