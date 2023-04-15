<%@ Page Title="" Language="C#" MasterPageFile="~/AppMasterPage.master" AutoEventWireup="true" CodeFile="web_ChonMenuDichVu.aspx.cs" Inherits="web_module_module_app_web_ChonMenuDichVu" %>
<%@ Register Src="~/web_usercontrol/menu_header.ascx" TagPrefix="uc1" TagName="linqheader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css/footer.css" rel="stylesheet" />
    <link href="../../css/css_Ngan/css_chonmenudichvu.css" rel="stylesheet" />
    <script src="../../admin_js/sweetalert.min.js"></script>
    <script>
        function myChonDichVu(id) {
            document.getElementById("<%=txtSanPham.ClientID%>").value = id;
            document.getElementById("<%=btnChonSanPham.ClientID%>").click();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="navabar">
        <a href="/hoa-don-dat-lich"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
        <div class="tieude"><span>DỊCH VỤ</span></div>
        <div class="icon-infor">
            <uc1:linqheader runat="server" ID="linqheader" />
        </div>
    </div>
    <div class="base">
        <div class="container_form">
            <div class="block-dichvu">
                <div class="list">
                    <asp:ScriptManager ID="scrDichVu" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="upDichVu" runat="server">
                        <ContentTemplate>
                            <asp:Repeater runat="server" ID="rpNhomDichVu" OnItemDataBound="rpNhomDichVu_ItemDataBound">
                                <ItemTemplate>
                                    <div class="block-tilte">
                                        <img src="../../app_image/MenuDichVu/menudichvu-1.png" />
                                        <h4 class="txt-nd"><%#Eval("loaisanpham_name") %></h4>
                                    </div>
                                    <div style="width: 95%; margin: 0 3%; height: 11px; background: pink;">
                                    </div>
                                    <asp:Repeater runat="server" ID="rpDichVuItem">
                                        <ItemTemplate>
                                            <a id="btnChon" href="#" onclick="myChonDichVu(<%#Eval("sanpham_id") %>)" class="block-menu">
                                                <span><%#Eval("sanpham_name") %></span>
                                                <span><%#Eval("sanpham_giatien", "{0:N0}") %>
                                                    <i style="color: pink" class="fa <%#Eval("sanpham_class") %>" aria-hidden="true"></i>
                                                </span>
                                            </a>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ItemTemplate>
                            </asp:Repeater>
                            <div style="display: none">
                                <input type="text" id="txtSanPham" runat="server" />
                                <a href="#" id="btnChonSanPham" runat="server" onserverclick="btnChonSanPham_ServerClick"></a>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
            </div>
            <i class="fa fa-file-text-o" aria-hidden="true"></i>
        </div>
    </div>


</asp:Content>


