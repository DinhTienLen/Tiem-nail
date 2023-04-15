<%@ Page Title="" Language="C#" MasterPageFile="~/AppMasterPage.master" AutoEventWireup="true" CodeFile="web_DongGia.aspx.cs" Inherits="web_module_module_app_web_DongGia" %>

<%@ Register Src="~/web_usercontrol/menu_header.ascx" TagPrefix="uc1" TagName="linqheader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../Dung_css/ribon.css" rel="stylesheet" />
    <link href="../../Dung_css/mainailboxchitiet.css" rel="stylesheet" />
    <link href="../../css/footer.css" rel="stylesheet" />
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
    <div class="navabar">
        <a href="Default.aspx"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
        <div class="tieude"><span>MẪU NAILS 69k</span></div>
        <div class="icon-infor">
            <uc1:linqheader runat="server" ID="linqheader" />
        </div>
    </div>
    <div class="base">
        <asp:ScriptManager ID="scpDinhVu" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="upDinhVu" runat="server">
            <ContentTemplate>
                <div class="block-nailbox row">
                    <asp:Repeater ID="rpDonggia" runat="server">
                        <ItemTemplate>
                            <div class="box col-5">
                                <a href="/danh-gia-san-pham">
                                    <div class="ribbon">
                                        <div class="ribbon-pink">69k</div>
                                    </div>
                                    <img class="img1" style="object-fit: cover" src="<%#Eval("sanpham_image") %>" />
                                    <div class="block-tillte">
                                        <b class="khung1"><%#Eval("sanpham_name") %></b>
                                        <b class="khung1"><%#Eval("sanpham_news") %></b>
                                        <div class="block-thongtin">
                                            <div class="dat-lich">
                                                <a id="btnChon" href="#" onclick="myChonDichVu(<%#Eval("sanpham_id") %>)">
                                                    <i class="fa fa-calendar" aria-hidden="true"><span><%#Eval("tinhtrang") %></span></i>
                                                </a>
                                            </div>
                                            <a href="#" id="btnHeart" onclick="myHeart(<%#Eval("sanpham_id") %>)">
                                                <i class="fa <%#Eval("heart") %>" aria-hidden="true"></i>
                                            </a>
                                        </div>
                                    </div>
                                </a>
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
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

