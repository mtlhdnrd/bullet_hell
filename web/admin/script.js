function LoginAdmin(){
    let username = $('#username_admin').val();
    let password = $('#password_admin').val();
    console.log(username);
    console.log(password);
    $.ajax({
        type: "GET",
        url: "admin_login_check.php",
        data: {username: username, password:password},
        success: function(data, textStatus, xhr)
        {
            switch(xhr.status)
            {
                case 200:
                    window.open("index.php", "_self");
                    $("#incorrect-login").addClass("d-none");
                    break;
                default:
                    break;
            }
        },
        error: function (xhr) {
            switch (xhr.status) {
                case 401:
                    $("#incorrect-login").removeClass("d-none");
                    break;
            }
        }
    });
}