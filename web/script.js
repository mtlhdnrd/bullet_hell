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
    if(!username.match(allowed_username)) {
        $("#username-invalid-character").removeClass("d-none");
    }else{
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
    if(!username.match(allowed_username)) {
        $("#username-invalid-character").removeClass("d-none");
    } else {
        $("#username-invalid-character").addClass("d-none");
        let data = $("#register-form").serialize();
        //TODO hash password
        $.ajax({
            type: "POST",
            url: 'api/register_user.php',
            data: data,
            success: function (data, textStatus, xhr) {
                switch (xhr.status) {
                    case 201:
                        window.open("index.php");
                }
            },
            error: function (data, textStatus, xhr) {
                console.error(xhr);
            }
        });
    }
}

function LoginUser(){
    let url = `api/login_check.php`;
    let data = $("#login-form").serialize();
    $.ajax({
        type: "GET",
        url: url,
        data: data,
        success: function (data) {
            console.log(data);
        },
    });
}

$(document).ready(function () {
    $('#username').keyup(function (event) {
        checkUsername($(this).val());
    });
});