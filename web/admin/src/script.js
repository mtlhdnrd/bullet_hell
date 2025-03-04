function LoginAdmin() {
    let url = "./admin_login_check.php";
    let password = $("#password").val();
    HashPassword(password).then(function(hash) {
        $.ajax({
            type: "GET",
            url: url,
            data: { password: hash },
            success: function (_data, _textStatus, xhr) {
                switch (xhr.status) {
                    case 200:
                        window.open("index.php", "_self");
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
