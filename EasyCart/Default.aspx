<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EasyCart.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Easy Cart</title>
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
    <!--Autocomplete-->
    <link href="autocomplete/jquery-ui.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .align {
            text-align: center;
        }

        .divSetUp {
            max-height: 300px;
            min-height: 300px;
            overflow: scroll;
        }
    </style>

    <!-- Autocomplete Textbox scripts -->
    <script type="text/javascript" src="autocomplete/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="autocomplete/jquery-ui.js"></script>
    <script type="text/javascript">
        function getProduct() {
            SearchText();
        }
        function SearchText() {
            $(".autosuggest").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Default.aspx/GetAutoCompleteData",
                        data: "{'productCategoryName':'" + $('#txtProduct').val() + "'}",
                        dataType: "json",

                        success: function (data) {
                            if (data.d.length > 0) {
                                response($.map(data.d, function (item) {
                                    return {
                                        label: item.split('/')[0],
                                        val: item.split('/')[1]
                                    }
                                }));
                            }
                            else {
                                response([{ label: 'No Records Found', val: -1 }]);
                            }
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    });
                },
                select: function (event, ui) {
                    if (ui.item.val == -1) {
                        $(this).val("");
                        return false;
                    }
                    $('#lblUserId').text(ui.item.val);
                }
            });
        }
    </script>
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
                                <h1 class="m-0 text-dark">Product Details</h1>
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
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
                <div class="row">
                    <section class="col-lg-9 connectedSortable">
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Search by Product Category or Name</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->

                            <div class="card-body">

                                <div class="input-group input-group-sm mb-0">
                                    <asp:TextBox ID="txtProduct" runat="server" ClientIDMode="Static" CssClass="autosuggest form-control" onkeydown="getProduct();" placeholder="Enter Product Category or Product Name"></asp:TextBox>
                                    <div class="input-group-append">
                                        <asp:Button ID="btnSearch" ClientIDMode="Static" runat="server" CssClass="btn btn-info" Text="Search" OnClick="btnSearch_Click"></asp:Button>
                                    </div>
                                </div>

                                <div runat="server" id="divDropdown" style="display: none; margin-top: 10px" class="input-group input-group-sm mb-0">
                                    <asp:DropDownList runat="server" ID="ddlProducts" ClientIDMode="Static" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlProducts_SelectedIndexChanged"></asp:DropDownList>
                                </div>

                                <div style="margin-top: 10px">
                                    <asp:GridView ID="grd_Product" HorizontalAlign="Center" AutoGenerateColumns="False" CssClass="display grid table table-hover table-striped table-bordered" runat="server" Visible="false">
                                        <Columns>
                                            <asp:BoundField HeaderText="ID" DataField="productID" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Small" HeaderStyle-CssClass="align" />
                                            <asp:BoundField HeaderText="Product Name" DataField="productName" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Small" HeaderStyle-CssClass="align" />
                                            <asp:BoundField HeaderText="Description" DataField="productDescription" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Small" HeaderStyle-CssClass="align" />
                                            <asp:BoundField HeaderText="Price" DataField="price" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Small" ItemStyle-CssClass="hide" DataFormatString="{0:c}" HtmlEncode="false" HeaderStyle-CssClass="align" />
                                            <asp:BoundField HeaderText="Category" DataField="productCategoryName" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Small" HeaderStyle-CssClass="align" />
                                        </Columns>
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <EditRowStyle BackColor="#999999" />
                                        <FooterStyle BackColor="#61A2B0" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#61A2B0" Font-Bold="True" ForeColor="White" Font-Size="X-Small" />
                                        <PagerStyle BackColor="#61A2B0" ForeColor="White" CssClass="gvwCasesPager pager cssPager gvPagerCss" />
                                        <RowStyle BackColor="White" ForeColor="#333333" Font-Size="Small" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />

                                    </asp:GridView>
                                </div>

                                <div class="col-lg-12" runat="server" id="empty" visible="false">
                                    <div class="callout callout-info">
                                        <h4>No such product available</h4>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-body -->

                        </div>

                    </section>
                    <section class="col-lg-3 connectedSortable">

                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Quick Search</h3>
                                <asp:HiddenField runat="server" ID='hidCatID' ClientIDMode="Static" />
                                <asp:Button ID="btnSearchCat" runat="server" ClientIDMode="Static" Style="display: none" OnClick="btnSearchCat_Click" />
                            </div>
                            <!-- /.card-header -->

                            <div runat="server" id="divCategory" class="row card-body divSetUp">
                            </div>
                            <!-- /.card-body -->

                        </div>
                    </section>
                </div>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            <!-- Footer -->
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
        function ans(i) {
            document.getElementById("<%=hidCatID.ClientID%>").value = i;
            document.getElementById("<%=btnSearchCat.ClientID%>").click();
        }
    </script>

    <!-- jQuery -->
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
    <!-- jQuery Knob Chart -->
    <script src="plugins/jquery-knob/jquery.knob.min.js"></script>
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
