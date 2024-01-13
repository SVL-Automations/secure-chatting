<?php
   						
    define ('hostnameorservername',"localhost");	 // Server Name or host Name 
    define ('serverusername','root'); // database Username 
    define ('serverpassword',''); // database Password 
    define ('databasename','securechatting'); // database Name 

    
    $project = "YCP SecureChat";
    $slogan = "Be Safe! Be Secure!";
    $officename = "YCP";
    $officename1 = "YCP";
    global $connection;
    $connection = @mysqli_connect(hostnameorservername,serverusername,serverpassword,databasename) or die('Connection could not be made to the SQL Server. Please contact report this system error at <font color="blue">88 5335 4141</font>');

    $conn = new mysqli(hostnameorservername, serverusername, serverpassword, databasename);
   
    function createKey()
    {
        $keyconfig = array(
            "digest_alg" => "sha512",
            "private_key_bits" => 1024,
            "private_key_type" => OPENSSL_KEYTYPE_RSA,
        );

        // Create the private and public key
        $res = openssl_pkey_new($keyconfig);
        return $res;
    }

    // i - integer
    // d - double
    // s - string
    // b - BLOB
?>
