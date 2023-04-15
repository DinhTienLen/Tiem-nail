<%@ page title="" language="C#" masterpagefile="~/AppMasterPage.master" autoeventwireup="true" codefile="web_MenuDichVu.aspx.cs" inherits="web_module_module_app_web_MenuDichVu" %>
<%@ Register Src="~/web_usercontrol/menu_header.ascx" TagPrefix="uc1" TagName="linqheader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css/css_Ngan/css_chonmenudichvu.css" rel="stylesheet" />
    <link href="../../css/footer.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="navabar">
        <a href="Default.aspx"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
        <div class="tieude"><span>DỊCH VỤ</span></div>
        <div class="icon-infor">
            <uc1:linqheader runat="server" ID="linqheader" />
        </div>
    </div>
    <div class="base">
        <div class="container_form">
            <div class="block-dichvu">
                <div class="list">
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
                                    <a class="block-menu">
                                        <span><%#Eval("sanpham_name") %></span>
                                        <span><%#Eval("sanpham_giatien", "{0:N0}") %></span>
                                    </a>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

