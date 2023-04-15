<%@ Page Title="" Language="C#" MasterPageFile="~/AppMasterPage.master" AutoEventWireup="true" CodeFile="web_ThongTinChiNhanh.aspx.cs" Inherits="web_module_module_app_web_ThongTinChiNhanh" %>
<%@ Register Src="~/web_usercontrol/menu_header.ascx" TagPrefix="uc1" TagName="linqheader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../Dung_css/thongtinchinhanh.css" rel="stylesheet" />
    <link href="../../css/footer.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="navabar">
        <a href="Default.aspx"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
        <div class="tieude"><span>THÔNG TIN CHI NHÁNH</span></div>
        <div class="icon-infor">
            <uc1:linqheader runat="server" ID="linqheader" />
        </div>
    </div>
        <div class="base">
            <div class="block-nailbox row " style="padding-bottom: 20%; padding-top:10%;">
                <asp:Repeater ID="rpTTChiNhanh" runat="server">
                    <ItemTemplate>
                        <a class="box" href="/thong-tin-chi-nhanh-chi-tiet-<%#Eval("thongtinchinhanh_id") %>">
                            <h2 class="text-red" style="color: #9b3745"><%#Eval("thongtinchinhanh_name") %></h2>
                            <img src="<%# Eval("thongtinchinhanh_image")%>" />
                            <div class="box-tt">
                                <h3 class="text-red">Địa chỉ: <%#Eval("thongtinchinhanh_diachi") %></h3>
                                <h3 class="text-red">Số điện thoại: <%#Eval("thongtinchinhanh_sodiemthoai") %></h3>
                            </div>
                        </a>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
</asp:Content>

