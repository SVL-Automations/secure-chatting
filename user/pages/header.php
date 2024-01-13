<header class="main-header">
  <!-- Logo -->
  <a href="index.php" class="logo">
    <!-- mini logo for sidebar mini 50x50 pixels -->
    <span class="logo-mini " style="font-size: 13px !important"><?= $officename1 ?></span>
    <!-- logo for regular state and mobile devices -->
    <span class="logo-lg " style="font-size: 15px !important"><?= $project ?> </span>
  </a>
  <!-- Header Navbar: style can be found in header.less -->
  <nav class="navbar navbar-static-top">
    <!-- Sidebar toggle button-->
    <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </a>

    <div class="navbar-custom-menu">
      <ul class="nav navbar-nav">
        <!-- User Account: style can be found in dropdown.less -->
        <li class="dropdown user user-menu">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <img src="../../dist/img/avatar5.png" class="user-image" alt="User Image">
            <span class="hidden-xs"><?= $_SESSION['name'] ?></span>
          </a>
          <ul class="dropdown-menu">
            <!-- User image -->
            <li class="user-header">
              <img src="../../dist/img/avatar5.png" class="img-circle" alt="User Image">
              <p>
                <?= $_SESSION['name'] ?>
                <small><?= $project ?> <?= $officename ?></small>
              </p>
            </li>
            <li class="user-body">
              <div class="row">
                <div class="text-center">
                  <span><i class="fa fa-user"></i> Designed by : YCP</span>
                </div>
                <div class="text-center">
                  <span><i class="fa fa-mobile"></i> : 88 7777 6666 </span>
                </div>
                <div class="text-center">
                  <span><i class="fa fa-internet-explorer"></i> : info@secureycp.in</span>
                </div>
              </div>
              <!-- /.row -->
            </li>
          </ul>
        </li>
      </ul>
    </div>
  </nav>
</header>

<!-- =============================================== -->

<!-- Left side column. contains the sidebar -->
<aside class="main-sidebar">
  <!-- sidebar: style can be found in sidebar.less -->
  <section class="sidebar">
    <!-- Sidebar user panel -->
    <div class="user-panel">
      <div class="pull-left image">
        <img src="../../dist/img/small.png" class="img-circle" alt="User Image">
      </div>
      <div class="pull-left info">
        <p style="white-space: normal;"><?= $_SESSION['name'] ?></p>
        <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
      </div>
    </div>

    <!-- sidebar menu: : style can be found in sidebar.less -->
    <ul class="sidebar-menu" data-widget="tree">

      <li>
        <a href="index.php">
          <i class="fa fa-dashboard"></i> <span>Dashboard</span>
        </a>
      </li>

      <li class="treeview">
        <a href="#">
          <i class="fa fa-commenting-o"></i> <span>Chat</span> <i class="fa  fa-hand-o-down pull-right"></i>
        </a>
        <ul class="treeview-menu">
          <li><a href="textchat.php"><i class="fa fa-expeditedssl"></i> Text Chat </a></li>
          <li><a href="imagechat.php"><i class="fa fa-user-secret"></i> Image Chat </a></li>
        </ul>
      </li>

      <li class="treeview">
        <a href="#">
          <i class="fa  fa-child"></i> <span>Profile</span> <i class="fa  fa-hand-o-down pull-right"></i>
        </a>
        <ul class="treeview-menu">
          <li><a href="profile.php"><i class="fa fa-user-plus"></i> Update Profile </a></li>
          <li><a href="changepassword.php"><i class="fa fa-exchange"></i> Update Password </a></li>
          <li><a href="logout.php"><i class="fa fa-power-off"></i> Logout </a></li>
        </ul>
      </li>
    </ul>
  </section>
  <!-- /.sidebar -->
</aside>

<!-- =============================================== -->