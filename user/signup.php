<?php

include("../comman.php");
include("../mail/mail.php");

session_start();
ob_start();

if (isset($_SESSION['YCP_SC'])) {
    header("location:pages/");
}


if (isset($_POST['Signup'])) {    
       
        //Generate Key
        $key = createKey();

        // Extract the private key from $res to $privKey
        openssl_pkey_export($key, $privKey);

        // Extract the public key from $res to $pubKey
        $pubKey = openssl_pkey_get_details($key);
        $pubKey = $pubKey["key"];

        $name = mysqli_real_escape_string($connection, $_POST['name']);
        $email = mysqli_real_escape_string($connection, $_POST['email']);
        $dob = mysqli_real_escape_string($connection, $_POST['birthdate']);
        $gender = mysqli_real_escape_string($connection, $_POST['gender']);
        $address = mysqli_real_escape_string($connection, $_POST['address']);
        $mobile = mysqli_real_escape_string($connection, $_POST['mobile']);

        $ptext = substr(str_shuffle("0123456789"), 0, 2) .
            substr(str_shuffle("abcdefghijkmnpqrstuvwxyz"), 0, 3) .
            substr(str_shuffle("ABCDEFGHJKLMNPQRSTUVWXYZ"), 0, 3);
        $encpassword = md5($ptext);
        $photo = 'avatar5.png';
        $msg = new \stdClass();
        $result = mysqli_query($connection, "SET NAMES utf8");
        $result = mysqli_query($connection, "INSERT INTO `user`(`name`, `email`, `mobile`, `password`, 
                                            `gender`, `dob`, `photo`, `address`, `status`, `publickey`, `privatekey`)
                                            VALUES('$name','$email','$mobile','$encpassword',
                                            '$gender','$dob','$photo','$address','1','$pubKey','$privKey')");

        if ($result === true) {            
            $msg->value = 1;
            $msg->type = "alert alert-success alert-dismissible ";
            $msg->data = "Registration completed successfully. Please check your email";
            
            $body =  "Dear " . $name . "  ,  <br/>

            Your new account is Created at " . $project . " as User. 
            <br/> Welcome you to the <b>" . $project . "</b>.We thank you for join with us.<br/><br/>
        
            Your login ID is :" . $email . "<br/>
            Your Password is : " . $ptext . "<br/><br/>
            Your Private Key : ".$privKey."<br/><br/>
            
            We request you to keep your login information confidential.<br/><br/>
            Thanks for Showing interest in our company.<br/><br/><br/>
            
            Regards,<br/>
            " . $project . "     
            ";

            $subject = "User Account Created at " . $project;
            $mailstatus = mailsend($email, $body, $subject, $project);
        } else {
            $msg->value = 0;
            $msg->type = "alert alert-danger alert-dismissible ";
            $msg->data = "Please check details or Email already exist.";            
        }    
    echo json_encode($msg);
    exit();
}

?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?= $project ?></title>
    <link rel="icon" href="../dist/img/small.png" type="image/x-icon">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="../bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="../bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="../bower_components/iCheck/square/blue.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

</head>

<body class="hold-transition login-page">
    <div class="login-box">

        <div class="login-logo">
            <a href="../"><b><?= $project ?> </b><br>User signup</a>
        </div>
        <!-- /.login-logo -->
        <div class="login-box-body">
            <div class="alert " id="alertclass" style="display: none">
                <button type="button" class="close" onclick="$('#alertclass').hide()">×</button>
                <p id="msg"></p>
            </div>
            <p class="login-box-msg">Sign up to start your session</p>

            <form action="" method="post" id="signupform">
                <div class="form-group has-feedback">
                    <label for="exampleInputEmail1">Name</label>
                    <input type="text" class="form-control" placeholder="Enter name" name="name" required id="name" pattern="[a-zA-Z\s]+">
                </div>

                <div class="form-group has-feedback">
                    <label for="exampleInputEmail1">Email</label>
                    <input type="email" class="form-control" placeholder="Enter email" name="email" required id="email">
                </div>

                <div class="form-group has-feedback">
                    <label for="exampleInputEmail1">Date of Birth</label>
                    <input type="date" class="form-control" placeholder="Enter DOB" name="birthdate" required id="birthdate" max="<?= date('Y-m-d') ?>">
                </div>

                <div class="form-group has-feedback">
                    <label for="exampleInputEmail1">Mobile</label>
                    <input type="number" class="form-control" placeholder="Enter Mobile" name="mobile" required id="mobile" min="2000000000" max="9999999999">
                </div>

                <div class="form-group has-feedback">
                    <label for="exampleInputEmail1">Gender</label>
                    <div class="radio">
                        <label>
                            <input type="radio" name="gender" id="gender" value="Male" required>
                            Male
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="gender" id="gender" value="Female" required>
                            Female
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label for="exampleInputEmail1">Address</label>
                    <textarea class="form-control" rows="3" placeholder="Enter Address" name="address" id='address' required></textarea>
                </div>

                <input type="hidden" name="Signup" value="Signup" id="Signup">
                <button type="submit" class="btn btn-lg btn-success btn-block " name="submit" id="submit">Sign Up</button>
                <a class="btn btn-lg btn-warning btn-block" href="index.php">Back</a>
            </form>
        </div>
        <!-- /.login-box-body -->
    </div>
    <!-- /.login-box -->

    <!-- jQuery 3 -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- iCheck -->
    <script src="../bower_components/iCheck/icheck.min.js"></script>
    <script>
        $(document).ready(function() {
            
            $('#signupform').submit(function(e) {

                $('#alertclass').removeClass();
                $('#msg').empty();

                e.preventDefault();

                $.ajax({
                    url: $(location).attr('href'),
                    type: 'POST',
                    data: $('#signupform').serialize(),
                    success: function(response) {
                        console.log(response);

                        var returnedData = JSON.parse(response);

                        if (returnedData['value'] == 1) {
                            $('#alertclass').addClass(returnedData['type']);
                            $('#msg').append(returnedData['data']);
                            $("#alertclass").show();
                            $('#signupform')[0].reset();
                        } else {
                            $('#alertclass').addClass(returnedData['type']);
                            $('#msg').append(returnedData['data']);
                            $("#alertclass").show();
                        }
                    }
                });

            });
        });
    </script>
</body>

</html>