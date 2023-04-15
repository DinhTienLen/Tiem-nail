<%@ Page Title="" Language="C#" MasterPageFile="~/AppMasterPage.master" AutoEventWireup="true" CodeFile="web_ThietLapTaiKhoan.aspx.cs" Inherits="web_module_module_app_web_ThietLapTaiKhoan" %>
<%@ Register Src="~/web_usercontrol/menu_header.ascx" TagPrefix="uc1" TagName="linqheader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css_Lai/css_ThietLapTaiKhoan.css" rel="stylesheet" />
    <script src="../../admin_js/sweetalert.min.js"></script>
    <link href="../../css/footer.css" rel="stylesheet" />
    <style>
        .py-2 {
            line-height: 8rem;
        }
        .from_avatar{
            margin:auto;
            position:relative;
            width:300px;
            height:300px;
        }
        #ContentPlaceHolder1_img_avatar{
            width: 100%;
            height: 100%;
            border-radius: 50%;
            object-fit: cover;
            position:absolute;
        }
        .mayAnhUpFile{
            position: absolute;
            width: 25%;
            bottom: 1%;
            right: 1%;
        }
        .mayAnhUpFile img{
            max-width:100%;
            border-radius:20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="navabar">
        <a href="/thong-tin-khach-hang"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
        <div class="tieude"><span>THIẾT LẬP TÀI KHOẢN</span></div>
        <div class="icon-infor">
            <uc1:linqheader runat="server" ID="linqheader" />
        </div>
    </div>
        <div class="base">
            <from runat="server" class="container_form">
                <div class="wrapper bg-white mt-sm-5">
                    <h4 class="pb-4 border-bottom">Sửa hồ sơ</h4>
                    <div style="width: 100%;display: flex;justify-content:center"><img style="width: 25%;" src="../../App_image/Longin/longin_logo.png" /></div>
                    <div class="py-2">
                        <div class="row py-2">
                            <div class="col-md-12">
                                <label for="firstname">Họ & tên:</label>
                                <input id="txt_HoTen" runat="server"  type="text" readonly class="bg-light form-control">
                            </div>
                            <div class="col-md-12">
                                <label for="phone">Số điện thoại:</label>
                                <input runat="server" id="txt_Phone" type="text" readonly class="bg-light form-control">
                            </div>
                        </div>
                        <div class="row py-2">
                            <div class="col-md-12">
                                <label for="email">Email:</label>
                                <input runat="server" id="txt_Gmail" type="text" readonly class="bg-light form-control">
                            </div>
                            <div class="col-md-12">
                                <label for="email">Địa chỉ:</label>
                                <input runat="server" id="txt_DiaChi" type="text" class="bg-light form-control">
                            </div>
                        </div>
                    </div>
                    <a href="#" id="btnLuu" runat="server" onserverclick="btnLuu_ServerClick" class="button-luu">Lưu</a>
                    
                </div>
            </from>
        </div>
    <script>
        var loadFileImg = function (event)  {
            var image = document.getElementById("ContentPlaceHolder1_img_avatar");
            image.src = URL.createObjectURL(event.target.files[0]);
        }
    </script>
</asp:Content>

