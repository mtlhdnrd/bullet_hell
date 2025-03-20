document.addEventListener("load", (event) => {
    $("#incorrect-password").addClass("d-none");
    $("#password-mismatch").addClass("d-none");
    $("#password-changed").addClass("d-none");
});
function changePassword() {
    let username = $("#username").text().trim();
    let password = $("#current-pw").val();

    isPasswordCorrect(username, password)
        .then((result) => {
            console.log(result);
            if (result) {
                $("#incorrect-password").addClass("d-none");

                //Check if the new passwords match
                let newpw = $("#new-pw").val();
                let newpw_again = $("#new-pw-again").val();
                if (newpw === newpw_again) {
                    HashPassword(newpw).then(function(hash) {
                        $.ajax({
                            type: "POST",
                            url: "./change_password.php",
                            data: { username: username, newpw: hash },
                            success: function (data, textStatus, xhr) {
                                switch (xhr.status) {
                                    case 200:
                                        $("#current-pw").val("");
                                        $("#new-pw").val("");
                                        $("#new-pw-again").val("");
                                        $("#password-changed").removeClass(
                                            "d-none"
                                        );
                                        $("#incorrect-password").addClass("d-none");
                                        $("#password-mismatch").addClass("d-none");

                                        break;
                                }
                            },
                        });
                    });
                } else {
                    //Password mismatch
                    $("#password-mismatch").removeClass("d-none");
                }
            } else {
                $("#incorrect-password").removeClass("d-none");
            }
        },
        function(reject) {
            console.error("Error:", reject);
            $("#incorrect-password").removeClass("d-none");
        });
}
function isPasswordCorrect(username, password) {
    return HashPassword(password).then(function(hash) {
        return new Promise((resolve, reject) => {
            $.ajax({
                type: "GET",
                url: "../login/login_check.php",
                data: { username: username, password: hash },
                success: function (data, textStatus, xhr) {
                    if (xhr.status === 200) {
                        resolve(true);
                    } else {
                        reject(new Error("Authentication failed"));
                    }
                },
                error: function (xhr, data) {
                    reject(new Error("An error occurred."));
                },
            });
        });
    });
}
