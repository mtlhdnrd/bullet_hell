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
            if (result) {
                $("#incorrect-password").addClass("d-none");

                //Check if the new passwords match
                let newpw = $("#new-pw").val();
                if ($("#new-pw").val() === $("#new-pw-again").val()) {
                    $.ajax({
                        type: "POST",
                        url: "../src/php/change_password.php",
                        data: { username: username, newpw: newpw },
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
                } else {
                    //Password mismatch
                    $("#password-mismatch").removeClass("d-none");
                }
            } else {
                $("#incorrect-password").removeClass("d-none");
            }
        })
        .catch((error) => {
            console.error("Error:", error);
            $("#incorrect-password").removeClass("d-none");
        });
}
function isPasswordCorrect(username, password) {
    return new Promise((resolve, reject) => {
        $.ajax({
            type: "GET",
            url: "../src/php/login_check.php",
            data: { username: username, password: password },
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
}
