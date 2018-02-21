$(document).ready(function () {
    $('#search-btn').click(function () {
        search_request();
    });
    $('#artist_name').keyup(function (e) {
        if(e.which == 13) {
            search_request();
        }
    });
});

function search_request() {
    var artistName = $('#artist_name').val();
    if (artistName) {
        swal({
            title: "Type your phone number",
            content: "input",
            icon: "warning",
            buttons: true,
            closeModal: false
        })
        .then(function(value) {
            $('.preloader').show();
            if (value) { send_data(artistName, value); }
        });
    }
}

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