<?php
function make_query($conn, $sql)
{
    return $conn -> query($sql);
}
