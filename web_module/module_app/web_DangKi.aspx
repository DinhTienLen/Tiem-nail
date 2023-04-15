<%@ Page Language="C#" AutoEventWireup="true" CodeFile="web_DangKi.aspx.cs" Inherits="web_module_module_app_web_DangKi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../css_Lai/css_DangKi.css" rel="stylesheet" />
    <script src="../../admin_js/sweetalert.min.js"></script>
</head>
<body>
    <form id="frm" runat="server">
        <div class="container_form">
            <div class="container_login">
                <div class="form_logo">
                    <img src="../../app_image/Longin/longin_logo.png" />
                </div>
                 <label>Số điện thoại *</label>
                <input type="text" id="txtSoDienThoai" runat="server" />
                <label>Họ & Tên *</label>
                <input type="text" id="txtHoTen" runat="server" />
                <label>Email</label>
                <input type="text" id="txtEmail" runat="server" />
                <label>Mã giới thiệu ( Nếu có)</label>
                <input type="text" id="txtMaGioiThieu" runat="server" />
                <asp:Button CssClass="btn_DangNhap" ID="btnDangki" runat="server" OnClick="btnDangki_ServerClick" Text="Đăng kí" />

            </div>
        </div>
    </form>
</body>
</html>
