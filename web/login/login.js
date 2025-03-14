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