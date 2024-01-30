<header class="main-header">
  <nav class="navbar navbar-static-top">
    <div class="container">
      <div class="navbar-header">
        <a href="index.php" class="navbar-brand"><?= $project ?></a>
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
          <i class="fa fa-bars"></i>
        </button>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
        <ul class="nav navbar-nav">
          <li><a href="index.php">Dashboard</a></li>

          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Chat <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
              <li><a href="textchat.php"><i class="fa fa-expeditedssl"></i> Text Chat </a></li>
              <li><a href="imagechat.php"><i class="fa fa-user-secret"></i> Image Chat </a></li>
            </ul>
          </li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Profile <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
              <li><a href="profile.php"><i class="fa fa-user-plus"></i> Update Profile </a></li>
              <li><a href="changepassword.php"><i class="fa fa-exchange"></i> Update Password </a></li>              
            </ul>
          </li>
        </ul>
      </div>
      <!-- /.navbar-collapse -->
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="../../userphoto/avatar5.png" class="user-image" alt="User Image">
              <span class="hidden-xs"><?= $_SESSION['name'] ?></span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="../../userphoto/avatar5.png" class="img-circle" alt="User Image">

                <p>
                  <?= $_SESSION['name'] ?>
                  <small><?= $project ?> <?= $officename ?></small>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">                  
                  <div class="col-xs-12 text-center">
                    <a href="logout.php">Sign out</a>
                  </div>
                </div>
                <!-- /.row -->
              </li>
            </ul>
          </li>
        </ul>
      </div>
      <!-- /.navbar-custom-menu -->
    </div>
    <!-- /.container-fluid -->
  </nav>
</header>