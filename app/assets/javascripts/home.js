$(document).ready(function () {
    $('#search-btn').click(function () {
        var artistName = $('#artist_name').val();
        if(artistName) {
            swal({
                title: "Type your phone number",
                content: "input",
                icon: "warning",
                buttons: true
            })
            .then(function(value) {
                $('.preloader').show();
                send_data(artistName, value);
                // swal(artistName, value, "success");
            });
        }
    });
});

function send_data(artist_name, phone_number) {
    $.ajax({
        url: 'home/search',
        dataType: 'script',
        method: 'post',
        data: {
            phone_number: phone_number,
            artist_name: artist_name,
            authenticity_token: $('meta[name="csrf-token"]').attr('content')
        }
    });
}