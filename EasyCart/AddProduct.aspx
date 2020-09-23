<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="EasyCart.AddProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Easy Cart - Add Product</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bbootstrap 4 -->
    <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- JQVMap -->
    <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/adminlte.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
    <!-- summernote -->
    <link rel="stylesheet" href="plugins/summernote/summernote-bs4.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
    <form id="form1" runat="server">
        <div class="wrapper">

            <!-- Navbar -->
            <nav class="main-header navbar navbar-expand navbar-white navbar-light">
                <!-- Left navbar links -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <a href="Default.aspx" class="nav-link">Home</a>
                    </li>
                </ul>

            </nav>
            <!-- /.navbar -->

            <!-- Main Sidebar Container -->
            <aside class="main-sidebar sidebar-dark-primary elevation-4">
                <!-- Brand Logo -->
                <a href="index3.html" class="brand-link">                    
                    <span class="brand-text font-weight-light">Easy Cart</span>
                </a>

                <!-- Sidebar -->
                <div class="sidebar">
                    <!-- Sidebar Menu -->
                    <nav class="mt-2">
                        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                            <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
                            <li class="nav-item has-treeview menu-open">
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="Default.aspx" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Dashboard</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item has-treeview menu-open">
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="AddProduct.aspx" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Add Product</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item has-treeview menu-open">
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="AddCategory.aspx" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Add Category</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                             <li class="nav-item has-treeview menu-open">
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="Login.aspx" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Logout</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                    <!-- /.sidebar-menu -->
                </div>
                <!-- /.sidebar -->
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <div class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1 class="m-0 text-dark">Add Product</h1>
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                                </ol>
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.container-fluid -->
                </div>
                <!-- /.content-header -->

                <!-- Main content -->
                <section class="content">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Add New Product</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->

                        <div class="card-body">

                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Product Name</label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="txtProductName" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Description</label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="txtDescription" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Price</label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="txtPrice" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">Category</label>
                                <div class="col-sm-10">
                                    <asp:DropDownList runat="server" ID="ddlCategory" ClientIDMode="Static" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <!-- /.card-body -->
                        <div class="card-footer">
                            <asp:Button ID="btnAddProduct" runat="server" CssClass="btn btn-info" ClientIDMode="Static" Text="Add Product" OnClientClick="return validate()" OnClick="btnAddProduct_Click" />
                            <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-default float-right" ClientIDMode="Static" Text="Cancel" OnClick="btnCancel_Click" />
                        </div>
                    </div>
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            <footer class="main-footer">
                <strong>Copyright &copy;<a>EasyCart</a>.</strong>
                All rights reserved.
   
                <div class="float-right d-none d-sm-inline-block">
                    <b>Version</b> 3.0.5
                </div>
            </footer>
        </div>
    </form>

    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtProductName.ClientID%>").value == "") {
                alert("Enter Product Name");
                  return false;
            }
            if (document.getElementById("<%=txtDescription.ClientID%>").value == "") {
                alert("Enter Description");
                return false;
            }
            if (document.getElementById("<%=txtPrice.ClientID%>").value == "") {
                alert("Enter Price");
                return false;
            }
            if (document.getElementById("<%=ddlCategory.ClientID%>").selectedIndex == 0) {
                alert("Select Category");
                return false;
            }
        }
    </script>
    <script src="plugins/jquery/jquery.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="plugins/jquery-ui/jquery-ui.min.js"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
            $.widget.bridge('uibutton', $.ui.button)
    </script>
    <!-- Bootstrap 4 -->
    <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Sparkline -->
    <script src="plugins/sparklines/sparkline.js"></script>
    <!-- JQVMap -->
    <script src="plugins/jqvmap/jquery.vmap.min.js"></script>
    <script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
    <!-- Tempusdominus Bootstrap 4 -->
    <script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
    <!-- Summernote -->
    <script src="plugins/summernote/summernote-bs4.min.js"></script>
    <!-- overlayScrollbars -->
    <script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/adminlte.js"></script>
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="dist/js/pages/dashboard.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js"></script>

</body>
</html>
