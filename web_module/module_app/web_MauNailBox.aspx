<%@ Page Title="" Language="C#" MasterPageFile="~/AppMasterPage.master" AutoEventWireup="true" CodeFile="web_MauNailBox.aspx.cs" Inherits="web_module_module_app_web_MauNailBox" %>
<%@ Register Src="~/web_usercontrol/menu_header.ascx" TagPrefix="uc1" TagName="linqheader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<link href="../../Dung_css/MauNailBox.css" rel="stylesheet" />
    <link href="../../css/footer.css" rel="stylesheet" />--%>
    <link href="../../css/css_Ngan/mainailboxchitiet.css" rel="stylesheet" />
    <link href="../../css/css_Ngan/ribon.css" rel="stylesheet" />
    <script src="../../admin_js/sweetalert.min.js"></script>
    <script type="text/javascript">
        function themGioHang(id) {
            document.getElementById("<%=txtIDNailbox.ClientID%>").value = id;
             document.getElementById("<%=btnGiohang.ClientID%>").click();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="navabar">
        <a href="Default.aspx"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
        <div class="tieude"><span>AlBUM NAILS BOX</span></div>
        <div class="icon-infor">
            <uc1:linqheader runat="server" ID="linqheader" />
        </div>
    </div>
    <div class="base">
        <div class="block-nailbox row">
            <asp:Repeater ID="rpNailBoxNew" runat="server">
                <ItemTemplate>
                    <div class="box col-5">
                        <a href="/danh-gia-san-pham">
                            <div class="ribbon">
                                <div class="ribbon-pink">Mới</div>
                            </div>
                            <img class="img1" src="<%#Eval("sanpham_image") %>" />
                            <div class="block-tillte">
                                <b class="khung1"><%#Eval("sanpham_name") %></b>
                                <b class="khung2"><%#Eval("sanpham_giatien", "{0:N0}") %></b>
                            </div>
                        </a>

                        <div class="block-dadat">
                            <p><%#Eval("sanpham_luotmua") %> Lượt mua </p>
                            <i class="fa fa-cart-plus" onclick="themGioHang(<%#Eval("sanpham_id")%>)" aria-hidden="true">
                                <span id="txtTinhTrang_GH_<%#Eval("sanpham_id")%>" class="block-thongso"><%#Eval("giohang")%></span>
                            </i>
                        </div>

                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:Repeater ID="rpNailBox" runat="server">
                <ItemTemplate>
                    <div class="box col-5">
                        <img class="img1" src="<%#Eval("sanpham_image") %>" />
                        <div class="block-tillte">
                            <b class="khung1"><%#Eval("sanpham_name") %></b>
                            <b class="khung2"><%#Eval("sanpham_giatien", "{0:N0}") %></b>
                        </div>
                        <div class="block-dadat">
                            <p>Đã có <%#Eval("sanpham_luotmua") %> lượt mua </p>
                            <i class="fa fa-cart-plus" onclick="themGioHang(<%#Eval("sanpham_id")%>)" aria-hidden="true">
                                <span id="txtTinhTrang_GH_<%#Eval("sanpham_id")%>" class="block-thongso"><%#Eval("giohang")%></span>
                            </i>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <input hidden="hidden" type="text" id="txtIDNailbox" runat="server" />
        <a id="btnGiohang" runat="server" onserverclick="btnGiohang_ServerClick"></a>

    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


</asp:Content>

