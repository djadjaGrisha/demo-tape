$(document).ready(function () {
    init_TelInput('#phone_number');
    // $('#phone_number').intlTelInput();

    $('#search-btn').click(function () {
        show_phone_number_modal();
    });
    $('#artist_name').keyup(function (e) {
        if(e.which == 13) {
            show_phone_number_modal();
        }
    });

    $('#applyPhone').click(function () {
        search_request();
    });
    $('#phone_number').keyup(function (e) {
        if(e.which == 13) {
            search_request();
        }
    });
});

function show_phone_number_modal() {
    var artistName = $('#artist_name').val();
    if (artistName) {
        $('#phoneModal').modal('show');
    }
}

function search_request() {
    var artistName = $('#artist_name').val();
    if (value_exists('#phone_number')) {
        $('#phoneModal').modal('hide');
        $('.preloader').show();
        send_data(artistName, $('#phone_number').val());
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

function init_TelInput(selector) {
    // init
    $(selector).intlTelInput();

    // on start
    var countryOnStart = $(selector).intlTelInput("getSelectedCountryData");
    $(selector).val('+' + countryOnStart.dialCode);

    // on change
    $(selector).on("countrychange", function (e, countryData) {
        $(selector).val('+' + countryData.dialCode);
    });
}

function value_exists(selector) {
    var value = $(selector).val() || '';
    if (!value) { return false; }
    var dialCode = $(selector).data().plugin_intlTelInput.selectedCountryData.dialCode;
    if ((value != dialCode) && (value != ('+' + dialCode))) { return true; }
}