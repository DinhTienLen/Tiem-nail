<%@ Page Title="" Language="C#" MasterPageFile="~/AppMasterPage.master" AutoEventWireup="true" CodeFile="web_DichVu.aspx.cs" Inherits="web_module_module_app_web_DichVu" %>
<%@ Register Src="~/web_usercontrol/menu_header.ascx" TagPrefix="uc1" TagName="linqheader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css/css_Ngan/css_DichVu.css" rel="stylesheet" />
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
            <asp:Repeater ID="rpNews" runat="server">
                <ItemTemplate>
                    <div class="list-1">
                        <div class="img">
                            <img src="../../<%#Eval("news_image") %>"/>
                        </div>
                        <div class="nd">
                            <h4 class="name_dvu"><%#Eval("news_title") %></h4>
                            <span><%#Eval("news_summary") %> </span>
                            <a class="text_dvu" href="/thong-tin-dich-vu-<%#Eval("news_id") %>">Xem thêm
                            </a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>

