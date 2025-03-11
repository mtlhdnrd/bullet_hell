<?php
if ($_SERVER["REQUEST_URI"] == "/bullet_hell/web/admin/admin_header.php") {
    header("Location: /bullet_hell/web/index.php");
}
?>
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Bullet hell - Admin</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="user_management.php">User management</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="weapon_management.php">Weapon management</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="map_management.php">Map management</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="music_management.php">Music management</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="character_management.php">Character management</a>
                </li>
                <hr class="nav-item">
                <li class="nav-item">
                    <a class="nav-link" href="../index.php">Back to homepage</a>
                </li>
            </ul>
        </div>
    </div>
</nav>