<?php

session_start();
ob_start();

include("../../comman.php");
include("../../mail/mail.php");

if (!isset($_SESSION['YCP_SC'])) 
{
  header("location:logout.php");
}

?>