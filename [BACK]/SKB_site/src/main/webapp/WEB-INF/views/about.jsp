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
    <meta name="_csrf_parameter" content="_csrf" />
    <meta name="_csrf_header" content="X-CSRF-TOKEN" />
    <meta name="_csrf" content="${_csrf.token}" />
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
                    <form:form modelAttribute="aboutPage" method="post" action="/about?${_csrf.parameterName}=${_csrf.token}">
                    <div class="modal-body">

                            <spring:bind path="id">
                                <form:hidden path="id"/>
                            </spring:bind>
                            <spring:bind path="text">
                                <form:textarea path="text" id="editor-body"/>
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
    </div>
    <div ></div>
    <div id="debug"></div>

</div>


    <%@include file="footer.jsp" %>


    <script>window.jQuery</script>
    <script src="../../resources/
    js/tether.min.js"></script>
    <script src="../../resources/bootstrap/js/bootstrap.js"></script>

    <script>
        $(document).ready(function () {

            var editor = $('#editor-body');

            var configFull = {
                lang: 'ru-RU', // default: 'en-US'
                shortcuts: true,
                airMode: false,
                minHeight: null, // set minimum height of editor
                maxHeight: null, // set maximum height of editor
                focus: true, // set focus to editable area after initializing summernote
                disableDragAndDrop: true,
                callbacks: {
                    onImageUpload: function (files) {
                        document.getElementById('debug').innerHTML = files[0].length;
                        uploadFile(files);
                    },

                    onMediaDelete: function ($target, editor, $editable) {

                        var fileURL = $target[0].src;
                        deleteFile(fileURL);

                        // remove element in editor
                        $target.remove();
                    }
                }
            };

            // Featured editor
            editor.summernote(configFull);

            // Upload file on the server.
            function uploadFile(filesForm) {

                data = new FormData();
                // Add all files from form to array.
//                for (var i = 0; i < filesForm.length; i++) {
//                    data.append("files",filesForm[i]);
//                };
                data.append("files",filesForm[0]);

                $.ajax({
                    data:data,
                    type: "POST",
                    url: "/images/upload",
                    cache: false,
                    headers: {'X-CSRF-TOKEN': $('meta[name="_csrf"]').attr('content')},
                    contentType: false,
                    processData: false,
                    success: function (images) {
                        editor.summernote('insertImage', images);
                        alert(images);
                        //console.log(images);
                        alert(images);
                        // If not errors.
                        if (typeof images['error'] == 'undefined') {

                            // Get all images and insert to editor.
                            for (var i = 0; i < images['url'].length; i++) {

                                editor.summernote('insertImage', images['url'][i], function ($image) {
                                    //$image.css('width', $image.width() / 3);
                                    //$image.attr('data-filename', 'retriever')
                                });
                            }
                        }
                        else {
                            // Get user's browser language.
                            var userLang = navigator.language || navigator.userLanguage;

                            if (userLang == 'ru-RU') {
                                var error = 'Ошибка, не могу загрузить файл! Пожалуйста, проверьте файл или ссылку. ' +
                                    'Изображение должно быть не менее 500px!';
                            }
                            else {
                                var error = 'Error, can\'t upload file! Please check file or URL. Image should be more then 500px!';
                            }

                            alert(error);
                        }
                    }
                });
            }

            // Delete file from the server.
            function deleteFile(file) {
                data = new FormData();
                data.append("file", file);
                $.ajax({
                    data: data,
                    type: "POST",
                    url: "/ajax/uploader/delete",
                    cache: false,
                    headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                    contentType: false,
                    processData: false,
                    success: function (image) {
                        //console.log(image);
                    }
                });
            }

        });

    </script>

</body>

</html>
