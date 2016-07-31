$( document ).ready(function() {
    $('.more-comments').click( function() {
        $(this).on('ajax:success', function(event, data, status, xhr) {
            var momentId = $(this).data("moment-id");
            $("#comments_" + momentId).html(data);
            $("#comments-paginator-" + momentId).html("<a id='more-comments' data-moment-id=" + momentId + "data-type='html' data-remote='true' href='/moments/" + momentId + "/comments>show more comments</a>");
        });
    });
});