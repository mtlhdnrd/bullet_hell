function TogglePwVisibility() {
    const $passwordInput = $("#password");
    const $eyeIcon = $("#eyeIcon");

    if ($passwordInput.attr("type") === "password") {
        $passwordInput.attr("type", "text");
        $eyeIcon.removeClass("fa-eye").addClass("fa-eye-slash");
    } else {
        $passwordInput.attr("type", "password");
        $eyeIcon.removeClass("fa-eye-slash").addClass("fa-eye");
    }
}

$(document).ready(function () {
    $("#username").keyup(function () {
        let username = $(this).val();
        if (username != "") {
            checkUsername(username);
        }
    });
});
function checkUsername(username, callback) {
    let allowed_username = /^[a-zA-Z0-9]{2,30}$/;
    if (!username.match(allowed_username)) {
        $("#username-invalid-character").removeClass("d-none");
    } else {
        $("#username-invalid-character").addClass("d-none");
    }
    let url = `../src/php/username_exists.php?user=${username}`;
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

function LoginUser() {
    HashPassword($("#password").val()).then(function(hash) {
        let url = "login_check.php";
        let username = $("#username").val();
        $.ajax({
            type: "GET",
            url: url,
            data: { username: username, password: hash },
            success: function (_data, _textStatus, xhr) {
                switch (xhr.status) {
                    case 200:
                        window.open("../index.php", "_self");
                        break;
                }
            },
            error: function (xhr) {
                switch (xhr.status) {
                    case 401:
                        $("#incorrect-login").removeClass("d-none");
                        break;
                }
            },
        });
    });
}