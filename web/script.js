function togglePwVisibility() {
    let field = document.getElementById("password");
    if (field.type === "password") {
        field.type = "text";
    } else {
        field.type = "password";
    }
}

function checkUsername(username, callback) {
    let allowed_username = /^[a-zA-Z0-9]{2,255}$/;
    if (!username.match(allowed_username)) {
        $("#username-invalid-character").removeClass("d-none");
    } else {
        $("#username-invalid-character").addClass("d-none");
    }
    let url = `api/username_exists.php?user=${username}`;
    $.ajax({
        type: "GET",
        url: url,
        success: function (data) {
            if (eval(`data.${username}`) == 1) {
                $("#username-exists").removeClass("d-none");

            } else {
                $("#username-exists").addClass("d-none");
            }
        },
    });
}
function addNewUser() {
    let allowed_username = /^[a-zA-Z0-9]{2,255}$/;
    if ($("#username").val().match(allowed_username)) {
        let data = $("#register-form").serialize();
        $.ajax({
            type: "POST",
            url: 'api/register_user.php',
            data: data,
            success: function (data, textStatus, xhr) {
                switch (xhr.status) {
                    case 201:
                        window.open("index.php", "_self");
                }
            },
            error: function (data, textStatus, xhr) {
                console.error(xhr);
            }
        });
    }
}

function LoginUser() {
    let url = `api/login_check.php`;
    let data = $("#login-form").serialize();
    $.ajax({
        type: "GET",
        url: url,
        data: data,
        success: function (data, textStatus, xhr) {
            switch (xhr.status) {
                case 200:
                    window.open("index.php", "_self");
                    break;
                
            }
        },
        error: function(xhr) {
            switch(xhr.status)
            {
                case 401:
                    $("#incorrect-login").removeClass("d-none");
                    break;
            }
        }
    });
}

$(document).ready(function () {
    $('#username').keyup(function (event) {
        checkUsername($(this).val());
    });
});