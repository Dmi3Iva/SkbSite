//      Функция для появления формы с комментарием и кнопки,
//          с помощью которых можно изменить комментарий
    function prepareForEdit(id) {
        var editButton = document.getElementById("editBtn" + id.toString());
        editButton.style.display = 'none';
        var comment = document.getElementById("textComment" + id.toString());
        comment.style.display = 'none';
        var text = comment.innerHTML;
        var inputForm = document.getElementById("editTextComment" + id.toString());
        inputForm.style.display = 'block';
        inputForm.value = text;
        var inputButton = document.getElementById("editBtnComment" + id.toString());
        inputButton.style.display = 'block';
        var cancelButton = document.getElementById("cancelChangeComment" + id.toString());
        cancelButton.style.display = 'block';
    }

//      Функция для динамического изменения комментария и
//      сохранения его в базу данных
    function changeComment(idComment){
        var formData = {
            id : idComment,
            content : $("#editTextComment" + idComment.toString()).val()
        };
        $.ajax({
            headers: {'X-CSRF-TOKEN': $('meta[name="_csrf"]').attr('content')},
            type: "POST",
            url: "/news-detailed/edit-comment",
            data: JSON.stringify(formData),
            contentType: 'application/json',
            success: function (result) {
                var comment = document.getElementById("textComment" + idComment.toString());
                comment.style.display = 'inline';
                comment.innerHTML = formData.content;
                var inputForm = document.getElementById("editTextComment" + idComment.toString());
                inputForm.style.display = 'none';
                var inputButton = document.getElementById("editBtnComment" + idComment.toString());
                inputButton.style.display = 'none';
                var cancelButton = document.getElementById("cancelChangeComment" + idComment.toString());
                cancelButton.style.display = 'none';
                var editButton = document.getElementById("editBtn" + idComment.toString());
                editButton.style.display = 'inline';
            }
        });
    }

//  Функция для отмены редактирования комментария
    function cancelEditComment(idComment) {
        var comment = document.getElementById("textComment" + idComment.toString());
        comment.style.display = 'block';
        var inputForm = document.getElementById("editTextComment" + idComment.toString());
        inputForm.style.display = 'none';
        var inputButton = document.getElementById("editBtnComment" + idComment.toString());
        inputButton.style.display = 'none';
        var cancelButton = document.getElementById("cancelChangeComment" + idComment.toString());
        cancelButton.style.display = 'none';
        var editButton = document.getElementById("editBtn" + idComment.toString());
        editButton.style.display = 'inline';
    }
