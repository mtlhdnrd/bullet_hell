function RegisterUser() {
    let allowed_username = /^[a-zA-Z0-9]{2,30}$/;
    if (!$("#username").val().match(allowed_username)) {
        $("#incorrect-register").removeClass("d-none");
    } else {
        $("#incorrect-register").addClass("d-none");
        let username = $("#username").val();
        HashPassword($("#password").val()).then(function(hash) {
            $.ajax({
                type: "POST",
                url: "register_user.php",
                data: { username: username, password: hash },
                success: function (data, textStatus, xhr) {
                    switch (xhr.status) {
                        case 201:
                            window.open("../index.php", "_self");
                    }
                    $.ajax({
                        type: "POST",
                        url: "../src/php/add_music_pack_to_player.php",
                        data: {username: username, musicKit: "CRT_HEAD1"},
                        success: function(data, textStatus, xhr){
                            console.log("Default music pack added to user");
                        }
                    });
                    $.ajax({
                        type: "POST",
                        url: "../src/php/add_skin_to_player.php",
                        data: {username: username, skinName: "knight"},
                        success: function(data, textStatus, xhr){
                            console.log("Default skin added to user");
                        }
                    });
                },
                error: function (data, textStatus, xhr) {
                    console.error(xhr);
                },
            });
        });
    }
}
