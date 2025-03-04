function RegisterUser() {
    let allowed_username = /^[a-zA-Z0-9]{2,30}$/;
    if (!$("#username").val().match(allowed_username)) {
        $("#username-invalid-character").removeClass("d-none");
    } else {
        $("#username-invalid-character").addClass("d-none");
        let data = $("#register-form").serialize();
        //TODO hash password
        $.ajax({
            type: "POST",
            url: "register_user.php",
            data: data,
            success: function (data, textStatus, xhr) {
                console.log(xhr.status);
                switch (xhr.status) {
                    case 201:
                        window.open("../index.php", "_self");
                }
            },
            error: function (data, textStatus, xhr) {
                console.error(xhr);
            },
        });
    }
}