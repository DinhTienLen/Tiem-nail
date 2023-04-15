<%@ Page Title="" Language="C#" MasterPageFile="~/AppMasterPage.master" AutoEventWireup="true" CodeFile="web_MaQR.aspx.cs" Inherits="web_module_module_app_web_MaQR" %>
<%@ Register Src="~/web_usercontrol/menu_header.ascx" TagPrefix="uc1" TagName="linqheader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css/css_MaQR.css" rel="stylesheet" />
    <link href="../../css/style.css" rel="stylesheet" />
    <link href="../../css/footer.css" rel="stylesheet" />
    <link href='https://fonts.googleapis.com/css?family=Great Vibes' rel='stylesheet'>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="navabar">
        <a href="Default.aspx"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
        <div class="tieude"><span>MÃ QR</span></div>
        <div class="icon-infor">
            <uc1:linqheader runat="server" ID="linqheader" />
        </div>
    </div>
    <div class="base">
        <div class="container_form">
            <%--<div class="content_share_now">
                        <p>CHIA SẺ NGAY</p>
                    </div>--%>
            <div class="block_Content">
                <div class="box_contain">
                    <div class="content_Qr">
                        <div class="content_share_now">
                        <p>CHIA SẺ NGAY</p>
                    </div>
                        <div class="content_QR_code">
                            <div class="images">
                                <img src="web_module/images/Unitag_QRCode_1652846454872.png" />
                            </div>
                            <span style="font-weight: 700; color: #e85677; margin-left: 22%; margin-top: 19px;"><span style="font-family: 'Great Vibes'; font-size: 75px; margin-left: -6%;">Sala</span><span style="margin-left: 25px; font-size: 42px;">NAILS & BEAUTY</span></span>
                            <%--<div class="sala_icon">
                                <img src="web_module/images/Unitag_QRCode_1652846454872.png" />
                            </div>--%>
                        </div>

                    </div>
                </div>
        </div>
    </div>
    </div>
</asp:Content>

