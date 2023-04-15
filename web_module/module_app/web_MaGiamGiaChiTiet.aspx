<%@ Page Title="" Language="C#" MasterPageFile="~/AppMasterPage.master" AutoEventWireup="true" CodeFile="web_MaGiamGiaChiTiet.aspx.cs" Inherits="web_module_module_app_web_ThongTinChiNhanhChiTiet" %>
<%@ Register Src="~/web_usercontrol/menu_header.ascx" TagPrefix="uc1" TagName="linqheader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../Dung_css/ThongTinChiNhanhChiTiet.css" rel="stylesheet" />
    <link href="../../css/footer.css" rel="stylesheet" />
    <script src="../../admin_js/sweetalert.min.js"></script>
    <style>
        .noidung {
            font-size: 20px;
            padding: 0% 2% 2% 2%;
            display: grid;
        }

        .tenChinhanh {
            font-size: 36px;
            color: #893F3F;
            padding: 2% 0;
            text-align: center;
            margin: 1%;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="navabar" style="position: unset">
        <a href="/ma-giam-gia"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
        <div class="tieude"><span>THÔNG TIN MÃ GIẢM GIÁ</span></div>
        <div class="icon-infor">
            <uc1:linqheader runat="server" ID="linqheader" />
        </div>
    </div>
    <div class="block-nailbox row">
        <div class="box col-11">
            <h2 class="tenChinhanh"><%# Eval("thongtinchinhanh_name")%></h2>
            <div class="noidung">
            </div>
        </div>
    </div>
</asp:Content>

