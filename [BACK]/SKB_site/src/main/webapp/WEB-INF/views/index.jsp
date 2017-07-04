<%@page pageEncoding="UTF-8"%>
<%@include file="includes/aboveHtml.jsp"%>
<c:set var="title" value="СКБ"/>
<!doctype html>
<html>
<head>
    <%@include file="includes/head.jsp"%>
    <link type="text/css" rel="stylesheet" href="/resources/css/index.css">
    <title>${title}</title>
</head>
<body>

<div id="leftSide">
</div>
<div id="rightSide">
</div>

<%@include file="includes/header.jsp" %>

    <!-- main-->
    <div id="carousel" class="carousel slide">
        <!--Индикаторы слайдов -->
        <ol class="carousel-indicators">
            <li class="active" data-target="#carousel" data-slide-to="0"></li>
            <li data-target="#carousel" data-slide-to="1"></li>
            <li data-target="#carousel" data-slide-to="2"></li>
        </ol>

        <!--Слайды -->
        <div class="carousel-inner">
            <div class="item active">
                <img src="/resources/images/Photo/IMG_0019.JPG" width="50%" alt="СКБ">
                <div class="carousel-caption">
                    <a href="/news"><h3>Новости</h3></a>
                    <p>Узнавай о текущих событиях</p>
                </div>
            </div>
            <div class="item">
                <img src="/resources/images/Photo/IMG_0003.JPG" width="50%" alt="drop2">
                <div class="carousel-caption">
                    <a href="/projects"><h3>Посмотреть проекты</h3></a>
                    <p>Предложи свой проект или присоединись к уже сформировавшейся команде</p>
                </div>
            </div>
            <div class="item">
                <img src="/resources/images/Photo/equipment.jpg" width="50%" alt="drop3">
                <div class="carousel-caption">
                    <a href="/equipment"><h3>Заказать оборудование</h3></a>
                    <p>Реализуй свою идею, используя наши возможности</p>
                </div>
            </div>
        </div>


        <!--Стрелки переключения между вкладками-->
        <a href="#carousel" class="left carousel-control" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a href="#carousel" class="right carousel-control" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
    </div>

<div class="container" >
    <div class= "row">
        <!--Новости и проекты-->
        <div class="row">
            <!--Новости раздел-->
            <div class="col-md-6" >
                <ul class="titleHead">
                    <li><div class="smallBlueBox"></div></li>
                    <li><h3>Новости</h3></li>
                    <li>
                        <div align="center" class=link>
                            <a href="/news">смотреть всё</a>
                        </div>
                    </li>
                </ul>

                <c:if test="${!empty news}">
                    <c:forEach items="${news}" var="item">
                        <div class="row">
                            <div class="col-md-6 block">
                                <p class="description">
                                    Автор:  <a href="/id${item.author.id}">${item.author.username}</a><br>
                                    ${item.timeOfCreation} <br>
                                    <c:if test="${item.project != null}">
                                        Проект: <a href="/project-detailed?projectId=${item.project.id}">${item.project.name}</a>
                                    </c:if>
                                </p>
                                <p class = "title">
                                    <a href="/news-detailed?newsId=${item.id}">${item.name}</a>
                                </p>
                                <p class="article">
                                    ${item.content}
                                </p>
                                <p class="detailes">
                                    <a href="/news-detailed?newsId=${item.id}">Подробнее...</a>
                                </p>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>

            </div>

            <div class="col-md-6">
                <ul class="titleHead">
                    <li><div class="smallBlueBox"></div></li>
                    <li><h3>Проекты</h3></li>
                    <li>
                        <div align="center" class=link>
                            <a href="/projects">смотреть всё</a>
                        </div>
                    </li>
                </ul>
                <c:if test="${!empty projects}">
                    <c:forEach items="${projects}" var="item">
                        <div class="row">
                            <div class="col-md-6 block">
                                <p class="description">
                                    Капитан:  <a href="/id${item.captain.id}">${item.captain.username}</a><br>
                                        ${item.dateOfStart}
                                </p>
                                <p class = "title">
                                    <a href="/project-detailed?projectId=${item.id}">${item.name}</a>
                                </p>
                                <div class="article">
                                        ${item.about}
                                </div>
                                <p class="detailes">
                                    <a href="/project-detailed?projectId=${item.id}">Подробнее...</a>
                                </p>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp" %>

</body>
</html>