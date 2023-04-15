<%@ Page Title="" Language="C#" MasterPageFile="~/AppMasterPage.master" AutoEventWireup="true" CodeFile="web_SanPhamYeuThich.aspx.cs" Inherits="web_module_module_app_web_SanPhamYeuThich" %>

<%@ Register Src="~/web_usercontrol/menu_header.ascx" TagPrefix="uc1" TagName="linqheader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css/css_Ngan/mainailboxchitiet2.css" rel="stylesheet" />
    <link href="../../css/css_Ngan/ribon.css" rel="stylesheet" />
    <link href="../../css/Rating.css" rel="stylesheet" />
    <script src="../../admin_js/sweetalert.min.js"></script>
     <script>
        function myChonDichVu(id) {
            document.getElementById("<%=txtSanPham.ClientID%>").value = id;
            document.getElementById("<%=btnChonSanPham.ClientID%>").click();
        }
        function myHeart(id) {
            document.getElementById("<%=txtSanPhamYeuThich.ClientID%>").value = id;
            document.getElementById("<%=btnLuuYeuThich.ClientID%>").click();
        }
     </script>
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
        <a href="/album-nails"><i style="font-size: 41px;" class="fa fa-chevron-left" aria-hidden="true"></i></a>
        <div class="tieude"><span>MẪU NAILS YÊU THÍCH</span></div>
        <div class="icon-infor">
            <uc1:linqheader runat="server" ID="linqheader" />
        </div>
    </div>
    <div class="base">
        <div class="block-nailbox row">
            <asp:Repeater ID="rpSanPham" runat="server">
                <ItemTemplate>
                    <div class="box col-5">
                        <img class="img1" src="<%#Eval("sanpham_image") %>" />
                        <div class="block-tillte">
                            <b class="khung1"><%#Eval("sanpham_name") %></b>
                        </div>
                        <div class="block-dadat">
                            <a id="btnChon" href="#" onclick="myChonDichVu(<%#Eval("sanpham_id") %>)"><i class="fa fa-calendar" aria-hidden="true">
                                 <span class="block-thongso"><%#Eval("tinhtrang") %></span>
                            </i>
                            </a>
                          <%--  <i class="fa fa-heart" aria-hidden="true"></i>--%>
                            <a href="#" id="btnHeart" onclick="myHeart(<%#Eval("sanpham_id") %>)">
                                <i class="fa <%#Eval("heart") %>" aria-hidden="true"></i>
                            </a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div style="display: none">
            <input type="text" id="txtSanPham" runat="server" />
            <a href="#" id="btnChonSanPham" runat="server" onserverclick="btnChonSanPham_ServerClick"></a>
            <input type="text" id="txtSanPhamYeuThich" runat="server" />
            <a href="javascipt:void(0)" id="btnLuuYeuThich" runat="server" onserverclick="btnLuuYeuThich_ServerClick"></a>
        </div>
    </div>
</asp:Content>

