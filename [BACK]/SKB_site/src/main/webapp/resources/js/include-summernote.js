$(document).ready(function () {

    var editor = $('.summernote-editor');

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
        for (var i = 0; i < filesForm.length; i++) {
            data.append("files",filesForm[i]);
        };


        $.ajax({
            data:data,
            type: "POST",
            url: "/images/upload",
            cache: false,
            headers: {'X-CSRF-TOKEN': $('meta[name="_csrf"]').attr('content')},
            contentType: false,
            processData: false,
            success: function (images) {
                for(var i=0;i<images.length;++i)
                    editor.summernote('insertImage', images[i]);
            }
        });
    }

    // Delete file from the server.
    function deleteFile(file) {
        data = new FormData();
        data.append("fileUrl", file);
        $.ajax({
            data: data,
            type: "POST",
            url: "/images/delete",
            cache: false,
            headers: {'X-CSRF-TOKEN': $('meta[name="_csrf"]').attr('content')},
            contentType: false,
            processData: false,
            success: function (image) {
                //console.log(image);
            }
        });
    }

});
