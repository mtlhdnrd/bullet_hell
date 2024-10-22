<?php
session_start();
function make_query($conn, $sql)
{
    return $conn -> query($sql);
}
function is_logged_in(){
    return isset($_SESSION['username']);
}
