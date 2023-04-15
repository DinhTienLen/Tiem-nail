<%@ Page Title="" Language="C#" MasterPageFile="~/AppMasterPage.master" AutoEventWireup="true" CodeFile="web_MauNail.aspx.cs" Inherits="web_module_module_app_web_MauNailBox" %>
<%@ Register Src="~/web_usercontrol/menu_header.ascx" TagPrefix="uc1" TagName="linqheader" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../Dung_css/MauNailBox.css" rel="stylesheet" />
    <link href="../../css/footer.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .item img {
            margin: 0;
            object-fit: cover;
            height: 20rem;
        }

        .owl-stage-outer {
            height: 20rem;
        }
    </style>
  <div class="navabar">
        <a href="Default.aspx"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
        <div class="tieude"><span>MẪU NAILS</span></div>
        <div class="icon-infor">
             <uc1:linqheader runat="server" ID="linqheader" />
        </div>
    </div>
    <div class="base">
        <div class="owl-carousel owl-theme">
            <asp:Repeater ID="rpSlide" runat="server">
                <ItemTemplate>
                    <div id="overlay">
                        <div class="item">
                            <img src="<%#Eval("sanpham_image") %>" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="row">
            <asp:Repeater ID="rpMauNail" runat="server">
                <ItemTemplate>
                    <a href="mau-nail-dat-lich-<%#Eval("loaisanpham_id")%>" class="block-nailbox col-sm-5">
                        <img src="<%#Eval("loaisanpham_image") %>" />
                        <span class="name-album"><%#Eval("loaisanpham_name") %></span>
                    </a>
                </ItemTemplate>
            </asp:Repeater>

        </div>
        <input type="text" hidden="hidden" id="txtIDLoaiNailBox" runat="server" />
    </div>
    <script>
       
        $(document).ready(function () {
            $('.owl-carousel').owlCarousel({
                loop: true,
                margin: 10,
                nav: true,
                responsive: {
                    0: {
                        items: 1
                    },
                }
            })
        });

    </script>
</asp:Content>

