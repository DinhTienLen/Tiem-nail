<%@ Page Title="" Language="C#" MasterPageFile="~/AppMasterPage.master" AutoEventWireup="true" CodeFile="web_ThongTinDichVuChiTiet.aspx.cs" Inherits="web_module_module_app_web_ThongTinDichVuChiTiet" %>
<%@ Register Src="~/web_usercontrol/menu_header.ascx" TagPrefix="uc1" TagName="linqheader" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css/footer.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        body {
            background-color: pink;
        }

        .base {
            overflow: hidden;
            margin-bottom: 6%;
            width: inherit;
        }

        .base-1 {
            overflow: auto;
            width: 96%;
            height: 106rem;
            margin: 13% 2%;
            background-color: white;
            box-shadow: -2px 5px 17px 1px #80808057;
            border-radius: 1px;
            padding: 3%;
        }

        h1 {
            font-size: 87px;
            font-weight: bold;
        }

        .base-1-noidung {
            font-size: 30px;
        }

        .base-1-img {
            margin: 3% 5%;
            width: 90%;
            height: 30%;
            object-fit: cover;
        }

        .btn-tuvan {
            background-color: pink;
            border: none;
            color: white;
            padding: 4px 17px;
            text-align: center;
            text-decoration: none;
            font-size: 40px;
            border-radius: 16px;
            width: 24%;
            margin-left: 73%;
            box-shadow: -2px 5px 17px 1px #80808057;
            font-weight: bold;
        }
    </style>
    <div class="navabar">
        <a href="/tin-tuc-dich-vu"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
        <div class="tieude"><span>THÔNG TIN DỊCH VỤ</span></div>
        <div class="icon-infor">
            <uc1:linqheader runat="server" ID="linqheader" />
        </div>
    </div>
    <div class="base">
        <asp:Repeater ID="rpNewsDetail" runat="server">
            <ItemTemplate>
                <div class="base-1">
            <center>
                <h1><%#Eval("news_title") %></h1>
            </center>
            <p class="base-1-noidung">
               <%#Eval("news_content") %>
            </p>
        </div>
            </ItemTemplate>
        </asp:Repeater>
        
    </div>
</asp:Content>

