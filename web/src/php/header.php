<?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/links.php");
?>
<nav class="navbar navbar-expand-lg bg-custom px-lg-5">
  <div class="container-fluid">
    <a class="navbar-brand me-auto" href="<?php $_SERVER['DOCUMENT_ROOT']?>/bullet_hell/web/main/index.php"><img src="../src/images/logo.png" width="70" height="70" alt=""></a>
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
      <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasNavbarLabel"><a href="index.php"><img src="../src/images/logo.png" width="70" height="70" alt=""></a></h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body bg-custom">
        <ul class="navbar-nav justify-content-center flex-grow-1 pe-3">
          <li class="nav-item">
            <a class="nav-link mx-lg-4 menu-element text-white fs-5" aria-current="page" href="#rolunk">the game</a>
          </li>
          <li class="nav-item ">
            <a class="nav-link mx-lg-4 text-white menu-element fs-5" href="../codex/">codex</a>
          </li>
          <li class="nav-item">
            <a class="nav-link mx-lg-4 text-white menu-element fs-5" href="#">leaderboards</a>
          </li>
        </ul>
      </div>
    </div>
    <a href="../profile/" class="login-button fs-5" id="login-username"><?php echo $_SESSION['username'];?></a>
    <a href="../src/php/logout.php" id="logout"><i class="fa-solid fa-right-from-bracket"></i></a>
    <button class="navbar-toggler shadow-none border-0 pe-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  </div>
</nav>