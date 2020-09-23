<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EasyCart.Login" %>

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
</head>
<body class="hold-transition login-page" style="background-color: #001e28">
    <form id="form1" runat="server">
        <div class="login-box" style="text-align: center">
            <asp:ScriptManager ID="ScriptManagerH1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel runat="server" ID="update1">
                <ContentTemplate>
                    <div id="fail_div" runat="server" class="alert alert-dismissible alert-danger" style="text-align: center; display: none; margin-bottom: 5px">
                        <button type="button" id="closealrts" class="close" data-dismiss="alert">×</button>
                        <asp:Label runat="server" ID="lblfail" ClientIDMode="Static" Text="Invalid Username or Password" Style="display: none; font-size: 12px"></asp:Label>
                        <asp:Label runat="server" ID="lblInactive" ClientIDMode="Static" Text="This user is Inactive" Style="display: none; font-size: 12px"></asp:Label>
                    </div>
                    <img src="images/logo.png" style="width: 60%;" />
                    <div class="login-box-body" style="color: White">
                        <div class="col-xs-12" id="login" runat="server">
                            <p class="login-box-msg">Sign in to start your shopping session</p>
                            <div class="form-group has-feedback">
                                <asp:TextBox runat="server" ID="txt_Usernm" class="form-control" placeholder="Username"></asp:TextBox>
                            </div>
                            <div class="form-group has-feedback">
                                <asp:TextBox runat="server" ID="txt_Pass" type="password" class="form-control" placeholder="Password"></asp:TextBox>
                            </div>
                            <div class="col-xs-12">
                                <asp:Button runat="server" ID="btnSignIn" type="submit"
                                    class="btn btn-block btn-flat" Text="Sign In" Style="background-color: #49c2d0; color: White"
                                    OnClick="btnSignIn_Click" OnClientClick="return passvalidate();"></asp:Button>
                            </div>

                        </div>
                    </div>

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div class="modal fade" id="basicModalRGresul" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="background-color: red; opacity: 0.8; padding: 10px">
                    <h5 style="color: #ffffff;" id="h5_errrs"></h5>
                </div>
            </div>
        </div>
        <a href="#" id="btmodalres" class="btn btn-default" data-toggle="modal" data-target="#basicModalRGresul" style="display: none"></a>
    </form>
    <script type="text/javascript">

        function passvalidate() {

            if (document.getElementById('<%=txt_Usernm.ClientID%>').value == "") {
                show_alertresul('Username is Required..!', '#F6826F')
                setTimeout(function () { document.getElementById("<%=txt_Usernm.ClientID%>").focus(); }, 3000);
                return false;
            }
            if (document.getElementById('<%=txt_Pass.ClientID%>').value == "") {
                show_alertresul('Password is Required..!', '#F6826F')
                setTimeout(function () { document.getElementById("<%=txt_Pass.ClientID%>").focus(); }, 3000);
                return false;
            }
        }

        function show_alertresul(msg, bgc) {
            document.getElementById('btmodalres').click();
            document.getElementById('h5_errrs').innerHTML = msg;
            document.getElementById('modal_alert_headresul').style.backgroundColor = bgc;
            setTimeout(function () { document.getElementById("close_alertresul").click(); }, 4000);
            return false;
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
