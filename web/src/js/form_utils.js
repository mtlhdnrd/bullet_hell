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

function OpenSite(site) {
    window.open(site, "_self");
}

$(document).ready(function() {
    $(".credential-input").keyup(function (e) {
        if (e.key == "Enter" || e.keyCode == 13) {
            $("#credential-submit-button").trigger("click");
        }
    });
});

async function HashPassword(password) {
    let encodedPassword = new TextEncoder("utf-8").encode(password);
    let hashBuffer = await window.crypto.subtle.digest("SHA-512", encodedPassword);
    let hashArray = Array.from(new Uint8Array(hashBuffer));
    let hashHex = hashArray
        .map((b) => b.toString(16).padStart(2, "0"))
        .join("");
    return hashHex;
}
