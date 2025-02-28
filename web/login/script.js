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
