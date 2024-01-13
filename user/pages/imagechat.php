<?php

include("sessioncheck.php");
include("imageencrypt.php");
date_default_timezone_set('Asia/Kolkata');

$userid = $_SESSION['userid'];
set_error_handler("customError");

function customError($errno, $errstr)
{
    $msg = new \stdClass();
    $msg->data = $errstr;
    $msg->type = "alert alert-danger alert-dismissible ";
    echo json_encode($msg);
    exit();
}

//Fetch messages from database

if (isset($_POST['tabledata'])) {

    $data = new \stdClass();
    $result = mysqli_query($connection, "SET NAMES utf8mb4");
    $result = mysqli_query($connection, "SELECT t.id,t.time,u.name as fromname,t.image from imagechat as t inner join user as u on t.fromid = u.id where t.toid  ='$userid' ORDER BY t.time DESC");
    $data->list = mysqli_fetch_all($result, MYSQLI_ASSOC);

    //Get list of user in DB
    $result = mysqli_query($connection, "SELECT * FROM user WHERE status = 1 AND id not in ($userid)");
    $data->userlist = mysqli_fetch_all($result, MYSQLI_ASSOC);

    echo json_encode($data);
    exit();
}

//Add new message  
if (isset($_POST['Add'])) {
    $msg = new \stdClass();
    $result = mysqli_query($connection, "SET NAMES utf8mb4");

    $receiverid = mysqli_real_escape_string($connection, trim(strip_tags($_POST["receiver"])));
    $message = mysqli_real_escape_string($connection, trim(strip_tags($_POST["message"])));
    
    //Get public key of user from DB
    $result = mysqli_query($connection, "SELECT publickey from user where id = '$receiverid'");
    $data = mysqli_fetch_assoc($result);
    $key = $data['publickey'];
    $date = date('Y-m-d H-i-s');

    //Encrypt message using public key of receiver
    openssl_public_encrypt($message, $message, $key);
    $message = base64_encode($message);
    // echo $message;

    //Save photo chatimages folder
    $img = $_FILES['photo']['name'];
    $name = pathinfo($img, PATHINFO_FILENAME);
    $tmp = $_FILES['photo']['tmp_name'];
    $size = $_FILES['photo']['size'];
    // get uploaded file's extension
    $ext = strtolower(pathinfo($img, PATHINFO_EXTENSION));
    $filename = $name . '_' . date("d-m-Y H-i-s") . '.' . $ext;
    move_uploaded_file($tmp, "../../chatimages/" . $filename);
    
    imgEncryption($message, $filename, $ext);   

    $stmt = $conn->prepare("INSERT INTO `imagechat`(`fromid`, `toid`, `time`, `image`) values(?, ?, ?,?)");
    $stmt->bind_param("ssss", $userid, $receiverid, $date, $filename);

    $insert = $stmt->execute();

    if ($insert > 0) {
        $msg->value = 1;
        $msg->data = "Message Send Successfully. ";
        $msg->type = "alert alert-success alert-dismissible ";
    } else {
        $msg->value = 0;
        $msg->data = "Please Check Information. or Try Again!!";
        $msg->type = "alert alert-danger alert-dismissible ";
    }

    echo json_encode($msg);
    exit();
}

//Decrypt message 
if (isset($_POST['View'])) {
    $msg = new \stdClass();
    $result = mysqli_query($connection, "SET NAMES utf8mb4");

    $editid = mysqli_real_escape_string($connection, trim(strip_tags($_POST["editid"])));
    $key = $_POST["key"];

    //Get image path from db for message
    $result = mysqli_query($connection, "SELECT * from imagechat where id = '$editid'");
    $message = mysqli_fetch_assoc($result);
    $image = $message['image'];

    //Decrypt Image - get enceypted message from image
    $encryptedMsg = imgDecryption($image);
    $encryptedMsg = base64_decode($encryptedMsg);

    //Decrypte message using reciver public key
    openssl_private_decrypt($encryptedMsg, $message, $key);

    $msg->message = $message;
    echo json_encode($msg);
    exit();
}

//Delete message 
if (isset($_POST['Delete'])) {
    $msg = new \stdClass();
    $result = mysqli_query($connection, "SET NAMES utf8mb4");

    $editid = mysqli_real_escape_string($connection, trim(strip_tags($_POST["editid"])));

    $result = mysqli_query($connection, "DELETE FROM imagechat where id = '$editid'");

    if ($result > 0) {
        $msg->value = 1;
        $msg->data = "Message Deleted Successfully. ";
        $msg->type = "alert alert-success alert-dismissible ";
    } else {
        $msg->value = 0;
        $msg->data = "Please Check Information. or Try Again!!";
        $msg->type = "alert alert-danger alert-dismissible ";
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
    <title><?= $project ?> : Image Chat Messages </title>
    <link rel="icon" href="../../dist/img/small.png" type="image/x-icon">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="../../bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="../../bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../dist/css/adminLTE.min.css">
    <!-- adminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="../../bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="../../bower_components/select2/dist/css/select2.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <style>
        tfoot input {
            width: 50%;
            padding: 3px;
            box-sizing: border-box;
        }
    </style>
</head>

<body class="hold-transition skin-blue sidebar-mini">
    <!-- Site wrapper -->
    <div class="wrapper">

        <?php include("header.php"); ?>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h4>
                    <?= $project ?>
                    <small><?= $slogan ?></small>
                </h4>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li><a href="#">User</a></li>
                    <li class="active">Image Chat</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Default box -->
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Image Chat Details</h3>
                                <a class="btn btn-social-icon btn-primary pull-right" style="margin:5px" title="Send New Message" data-toggle="modal" data-target="#modaladdmessage"><i class="fa fa-plus"></i></a>
                            </div>
                            <div class="alert " id="alertclass" style="display: none">
                                <button type="button" class="close" onclick="$('#alertclass').hide()">×</button>
                                <p id="msg"></p>
                            </div>
                            <!-- /.box-header -->
                            <!-- form start -->
                            <div class="box-body  table-responsive">
                                <table id="example1" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th class='text-center'>Id</th>
                                            <th class='text-center'>From</th>
                                            <th class='text-center'>Image</th>
                                            <th class='text-center'>Date/Time</th>
                                            <th class='text-center'>Decrypt</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbody">

                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th class='text-center'>Id</th>
                                            <th class='text-center'>From</th>
                                            <th class='text-center'>Image</th>
                                            <th class='text-center'>Date/Time</th>
                                            <th class='text-center'>Decrypt</th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                        <!-- /.box-body -->
                        <!-- /.box-footer-->
                    </div>
                </div>
            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->
        <!-- Add message User modal -->
        <form id="addmessage" action="" method="post" enctype="multipart/form-data">
            <div class="modal fade" id="modaladdmessage" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header bg-primary">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span></button>
                            <h4 class="modal-title">Send New Message </h4>
                        </div>
                        <div class="modal-body">
                            <div class="alert " id="addalertclass" style="display: none">
                                <button type="button" class="close" onclick="$('#addalertclass').hide()">×</button>
                                <p id="addmsg"></p>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputPassword1">Receiver </label>
                                <select class="form-control select2 select3" style="width: 100%;" required name="receiver" id="receiver">
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Message</label>
                                <textarea class="form-control" rows="3" placeholder="Message" name="message" id="message"></textarea>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Image</label>
                                <input type="file" class="form-control" name="photo" id="photo" required accept='image/*'>
                                <img src="" alt="No Image" id="img" style='height:150px;'>
                            </div>
                        </div>
                        <div class="modal-footer ">
                            <input type="hidden" name="Add" value="Add">
                            <button type="submit" name="Add" value="Add" id='add' class="btn btn-success" disabled>Send Me</button>
                            <button type="button" class="btn pull-right btn-warning" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
        </form>
        <!-- End Add message user modal -->


        <!-- decrypt message User modal -->
        <form id="viewmessage" action="" method="post" enctype="multipart/form-data">
            <div class="modal fade" id="modalviewmessage" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header bg-green">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span></button>
                            <h4 class="modal-title">Decrypt Message </h4>
                        </div>
                        <div class="modal-body">
                            <div class="alert " id="addalertclass" style="display: none">
                                <button type="button" class="close" onclick="$('#addalertclass').hide()">×</button>
                                <p id="addmsg"></p>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputPassword1">From : </label>
                                <label for="exampleInputPassword1" id="frommessage">From </label>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Date/Time :</label>
                                <label for="exampleInputEmail1" id="encryptedmessage"></label>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Private Key</label>
                                <textarea class="form-control" rows="3" placeholder="Enter Private Key" name="key" id="key"></textarea>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Decrypted Message</label>
                                <textarea class="form-control" rows="3" placeholder="Message" name="decryptedmessage" id="decryptedmessage" readonly></textarea>
                            </div>

                        </div>
                        <div class="modal-footer ">
                            <input type="hidden" name="editid" id='editid'>
                            <input type="hidden" name="View" value="View">
                            <button type="submit" name="View" value="View" id='view' class="btn btn-success">Decrypted Me</button>
                            <button type="button" class="btn pull-right btn-warning" data-dismiss="modal" id="closeb">Close</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->

            </div>
        </form>
        <!-- End Add author user modal -->

        <?php include("footer.php"); ?>

    </div>
    <!-- ./wrapper -->

    <!-- jQuery 3 -->
    <script src="../../bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="../../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- SlimScroll -->
    <script src="../../bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="../../bower_components/fastclick/lib/fastclick.js"></script>
    <!-- adminLTE App -->
    <script src="../../dist/js/adminlte.min.js"></script>
    <!-- adminLTE for demo purposes -->
    <script src="../../dist/js/demo.js"></script>
    <!-- DataTables -->
    <script src="../../bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="../../bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <!-- Select2 -->
    <script src="../../bower_components/select2/dist/js/select2.full.min.js"></script>
    <script>
        $(document).ready(function() {
            $('.sidebar-menu').tree()

            $('[data-toggle="tooltip"]').tooltip();

            $('#example1').DataTable({
                stateSave: true,
                destroy: true,
            });

            //Initialize Select2 Elements
            $('.select2').select2()

            //get message from DB and display data table   
            function tabledata() {
                $('.select2').empty();
                $('#example1').dataTable().fnDestroy();
                $('#example1 tbody').empty();
                $('#addmessage')[0].reset();

                $.ajax({
                    url: $(location).attr('href'),
                    type: 'POST',
                    data: {
                        'tabledata': 'tabledata'
                    },
                    success: function(response) {
                        //console.log(response);
                        var returnedData = JSON.parse(response);
                        var srno = 0;
                        $.each(returnedData['list'], function(key, value) {
                            srno++;
                            var deletemessage = "";
                            var datatext = 'data-editid="' + value.id + '" data-fromname="' + value.fromname + '" data-message="' + value.time + '"';

                            var editbutton = '<button type="submit" name="Edit" id="edit" ' +
                                datatext +
                                ' class="btn btn-xs btn-info edit-button" style= "margin:5px" title="View message" data-toggle="modal" data-target="#modalviewmessage"><i class="fa fa-eye"></i></button>';

                            deletemessage = '<button type="submit" name="Update" id="Update" ' +
                                'data-editid="' + value.id +
                                '" class="btn btn-xs btn-danger delete-button" style= "margin:5px" title="Delete Message" ><i class="fa fa-close"></i></button>';

                            var html = '<tr class="odd gradeX">' +
                                '<td class="text-center">' + srno + '</td>' +
                                '<td class="text-center">' + value.fromname + ' </td>' +
                                '<td class="text-center"><a href="../../chatimages/' + value.image + '">View</a></td>' +
                                '<td class="text-center">' + value.time + '</td>' +
                                '<td class="text-center">' + editbutton + deletemessage + '</td>' +
                                '</tr>';
                            $('#example1 tbody').append(html);
                        });

                        $('#example1').DataTable({
                            stateSave: true,
                            destroy: true,
                        });

                        $('.select3').append(new Option("Select user", ""));
                        $.each(returnedData['userlist'], function(key, value) {
                            $('.select3').append(new Option(value.name, value.id));
                        });

                        $('.select2').select2()
                    }
                });
            }

            tabledata();

            //Display image when photo upload and validate filesize and type
            $('#photo').on('change', function() {

                const size = (this.files[0].size / 1024 / 1024).toFixed(2);
                var extension = $("#photo").val().replace(/^.*\./, '');
                const allowed = "jpg";

                if (size > 5 || !(extension == allowed)) {
                    alert("File must be less than 5 MB and jpg extentions only.");
                    $('#add').prop('disabled', true);

                } else {
                    if (this.files && this.files[0]) {

                        var reader = new FileReader();
                        reader.onload = function(e) {
                            document.querySelector("#img").setAttribute("src", e.target.result);
                        };

                        reader.readAsDataURL(this.files[0]);
                    }
                    $('#add').prop('disabled', false);
                }
            });

            //Send message and store in db
            $('#addmessage').submit(function(e) {

                $('#example1').dataTable().fnDestroy();
                $('#example1 tbody').empty();

                $('#addalertclass').removeClass();
                $('#addmsg').empty();

                e.preventDefault();

                $.ajax({
                    url: $(location).attr('href'),
                    type: 'POST',
                    data: new FormData(this),
                    enctype: 'multipart/form-data',
                    processData: false, // tell jQuery not to process the data
                    contentType: false, // tell jQuery not to set contentType

                    success: function(response) {
                        // console.log(response);
                        returnedData = JSON.parse(response);
                        if (returnedData['value'] == 1) {
                            $('#addmessage')[0].reset();
                            $('#addalertclass').addClass(returnedData['type']);
                            $('#addmsg').append(returnedData['data']);
                            $("#addalertclass").show();
                            tabledata();
                        } else {
                            $('#addalertclass').addClass(returnedData['type']);
                            $('#addmsg').append(returnedData['data']);
                            $("#addalertclass").show();
                            tabledata();
                        }

                    }
                });

            });

            //Delete message
            $(document).on("click", ".delete-button", function(e) {

                $('#alertclass').removeClass();
                $('#msg').empty();

                e.preventDefault();
                $.ajax({
                    url: $(location).attr('href'),
                    type: 'POST',
                    data: {
                        'Delete': 'Delete',
                        'editid': $(this).data('editid'),
                        'status': $(this).data('status')
                    },
                    success: function(response) {
                        //console.log(response);
                        returnedData = JSON.parse(response);
                        if (returnedData['value'] == 1) {
                            $('#alertclass').addClass(returnedData['type']);
                            $('#msg').append(returnedData['data']);
                            $("#alertclass").show();
                            tabledata();
                        } else {
                            $('#alertclass').addClass(returnedData['type']);
                            $('#msg').append(returnedData['data']);
                            $("#alertclass").show();
                        }
                        tabledata();
                    }
                });
            });

            //Message to decrypted modal
            $(document).on("click", ".edit-button", function(e) {
                $('#editalertclass').removeClass();
                $('#editmsg').empty();
                $(".modal-body #frommessage").text($(this).data('fromname'));
                $(".modal-body #encryptedmessage").text($(this).data('message'));
                $("#editid").val($(this).data('editid'));
            });

            //Decrypte message
            $('#viewmessage').submit(function(e) {
                $('#editalertclass').removeClass();
                $('#editmsg').empty();
                e.preventDefault();

                $.ajax({
                    url: $(location).attr('href'),
                    type: 'POST',
                    data: $('#viewmessage').serialize(),
                    success: function(response) {
                        // console.log(response);
                        returnedData = JSON.parse(response);
                        $(".modal-body #decryptedmessage").val(returnedData['message']);
                    }
                });
            });
            //Close tab and reset 
            $('#closeb').click(function(e) {
                // alert("demo");
                $('#viewmessage')[0].reset();
            })
        })
    </script>
</body>

</html>