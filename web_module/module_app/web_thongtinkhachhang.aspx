<%@ Page Title="" Language="C#" MasterPageFile="~/AppMasterPage.master" AutoEventWireup="true" CodeFile="web_ThongTinKhachHang.aspx.cs" Inherits="web_module_module_app_web_thongtinkhachhang" %>

<%@ Register Src="~/web_usercontrol/menu_header.ascx" TagPrefix="uc1" TagName="linqheader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css_Lai/css_ThongTinKhachHang.css" rel="stylesheet" />
    <link href="../../css/style.css" rel="stylesheet" />
    <link href="../../css/footer.css" rel="stylesheet" />
    <style>
        .hangBac {
            background-color: #C0C0C0;
            color: black;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="navabar" style="position: unset">
        <a href="Default.aspx"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
        <div class="tieude"><span>THÔNG TIN KHÁCH HÀNG</span></div>
        <div class="icon-infor">
            <uc1:linqheader runat="server" ID="linqheader" />
        </div>
    </div>
    <div class="base">
        <div class="container_thongtinkhachhang">
            <div class="header1">
                <div class="header_add">
                    <img runat="server" id="img_avatar" src="../../App_image/Longin/longin_logo.png" />
                    <span class="name" runat="server" id="txt_Ten">Nguyễn Thị Linh</span>
                    <div runat="server" class="header_hang" id="div_hang">
                        <span id="txt_Hang" runat="server">Hạng bạc</span>
                    </div>
                </div>
            </div>
            <div class="contend">
                <div class="content_tinhtrangdonhang">
                    <a href="/thong-tin-don-hang" class="tinhtrangdonhang_khung">
                        <p>
                            <img src="../../app_image/thongtinkhachhang/icon_cholayhang.png" />
                        </p>
                        <span>Chờ xác nhận</span>
                    </a>
                    <a href="/thong-tin-don-hang" class="tinhtrangdonhang_khung">
                        <p>
                            <img style="width: 127px;" src="../../app_image/thongtinkhachhang/icon_giaohang.png" />
                        </p>
                        <span>Đang giao</span>
                    </a>
                    <a href="/thong-tin-don-hang" class="tinhtrangdonhang_khung">
                        <p>
                            <img style="width: 86px" src="../../app_image/thongtinkhachhang/icon_giaohangthanhcong.png" />
                        </p>
                        <span>Đã giao</span>
                    </a>
                </div>
                <div class="content_thietlap">
                    <div class="content_thietlap_khovoucher">
                        <a href="/ma-giam-gia">
                            <div class="block-thongtin"></div>
                            <img src="../../app_image/thongtinkhachhang/icon_khovoucher.png" />
                            <span>Kho voucher</span>
                        </a>
                        <i class="fa fa-chevron-right" aria-hidden="true"></i>
                    </div>
                    <a href="/thiet-lap-tai-khoan" class="content_thietlap_khovoucher">
                        <div class="block-thongtin">
                            <img src="../../app_image/thongtinkhachhang/icon_thietlap.png" />
                            <span>Thiết lập tài khoản</span>
                        </div>
                        <i class="fa fa-chevron-right" aria-hidden="true"></i>
                    </a>
                    <a href="/gioi-thieu-ban-be" class="content_thietlap_khovoucher">
                        <div class="block-thongtin">
                            <img src="../../app_image/thongtinkhachhang/icon_gioithieu.png" />
                            <span>Giới thiệu bạn bè</span>
                        </div>
                        <i class="fa fa-chevron-right" aria-hidden="true"></i>
                    </a>
                    <a id="btnDangXuat" runat="server" onserverclick="btnDangXuat_ServerClick" class="content_thietlap_khovoucher">
                        <div class="block-thongtin" style="width: 100%;">
                            <i class="fa fa-sign-out" aria-hidden="true"></i>
                            <span>Đăng xuất</span>
                        </div>
                    </a>
                </div>
            </div>
        </div>
</asp:Content>

