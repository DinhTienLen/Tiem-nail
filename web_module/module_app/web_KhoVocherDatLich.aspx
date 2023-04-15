<%@ Page Title="" Language="C#" MasterPageFile="~/AppMasterPage.master" AutoEventWireup="true" CodeFile="web_KhoVocherDatLich.aspx.cs" Inherits="web_module_module_app_web_KhoVocherDatLich" %>

<%@ Register Src="~/web_usercontrol/menu_header.ascx" TagPrefix="uc1" TagName="linqheader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css_Lai/magiamgia2.css" rel="stylesheet" />
    <script src="../../admin_js/sweetalert.min.js"></script>
    <script>
        function myChon(id) {
            document.getElementById("<%=txtMaVach.ClientID%>").value = id;
            document.getElementById("<%=btnLuu.ClientID%>").click();
        }
    </script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .nav-tabs .nav-link.active {
            background-color: white;
            color: #e74c65;
        }

        #btnChon {
            font-size: 30px;
            background-color: antiquewhite;
            padding: 2%;
            height: 81px;
            color: #e74a62;
            box-shadow: -2px 2px 0px 1px #80808087;
            font-weight: 700;
        }

        .tab-content {
            background-color: #f3f4f6;
        }

        .content-vcleft p {
            font-size: 75px;
        }

        .content-vcleft2 p {
            font-size: 75px;
        }

        .content-vcleft {
            display: flex;
            text-align: center;
            margin: auto;
            height: 105.5%;
            color: white;
            background: linear-gradient(90deg,transparent 0,transparent 0.1875rem,#cb0072 0);
            align-items: center;
            justify-content: center;
        }

        .content-vcleft2 {
            display: flex;
            text-align: center;
            margin: auto;
            color: white;
            height: 105.5%;
            background: linear-gradient(90deg,transparent 0,transparent 0.1875rem,#1CA65C 0);
            align-items: center;
            justify-content: center;
        }

        .textmgg1 {
            margin-left: 8px;
            padding-top: 15px;
            color: #cc2871;
            font-weight: 500;
        }

        .textmgg2 {
            margin-left: 8px;
            padding-top: 15px;
            color: #1CA65C;
            font-weight: 500;
        }

        .border-rangcua {
            position: absolute;
            top: 0.3125rem;
            left: 0;
            width: 1.55rem;
            height: calc(106% - 0.4375rem);
            background: radial-gradient(circle at 0 0.3rem,transparent 0,transparent 0.5875rem,#cb0072 0);
            background-size: 2.5rem 1.55rem;
            background-repeat: repeat-y;
        }

        .border-rangcua2 {
            position: absolute;
            top: 0.3125rem;
            left: 0;
            width: 1.55rem;
            height: calc(106% - 0.4375rem);
            background: radial-gradient(circle at 0 0.3rem,transparent 0,transparent 0.5875rem,#1CA65C 0);
            background-size: 2.5rem 1.55rem;
            background-repeat: repeat-y;
        }

        .voucher-row {
            border: none;
            box-shadow: 11px 4px 10px 0px #80808078;
        }

        .voucher-row2 {
            border: none;
            box-shadow: 11px 4px 10px 0px #80808078;
        }

        .textmgg {
            color: #9e9e9e;
            font-size: 27px;
            font-weight: 700;
        }

        .textmgg-main {
            color: black;
            font-weight: 400;
        }

        .btn.btn-primary.btnluumgg {
            background-color: #cc2871;
            color: white;
            font-weight: 700;
            border: unset;
            border-radius: unset;
        }

        #btnChon {
            background-color: antiquewhite;
            /* width: 20px; */
            box-shadow: 4px 7px 9px -1px #80808059;
            color: #e8506d;
            font-weight: 600;
            font-size: 36px;
            padding: 2%;
            /* display: flex; */
            height: 94px;
        }
    </style>
    <div class="navabar">
        <a href="/hoa-don-dat-lich"><i style="font-size: 41px;" class="fa fa-chevron-left" aria-hidden="true"></i></a>
        <div class="tieude"><span>KHO MÃ GIẢM GIÁ</span></div>
        <div class="icon-infor">
            <uc1:linqheader runat="server" ID="linqheader" />
        </div>
    </div>

    <div class="base">
        <%--tab mgg--%>
        <div class="tab-mgg">
            <%--content mgg--%>
            <p class="textmgg2">
                <asp:Label ID="lblMaGiamGia" runat="server"></asp:Label> 
            </p>
            <div class="container-fluid">
                <asp:Repeater ID="rpMaKhachHangSala" runat="server">
                    <ItemTemplate>
                        <div class="row voucher-row">
                            <div class="col-3 voucher-left">
                                <div class="border-rangcua">
                                </div>
                                <div class="content-vcleft">
                                    <p class="textmggleft"><%#Eval("magiamgia_sogiam") %>%</p>
                                </div>
                            </div>
                            <div class="col voucher-right">
                                <p class="textmgg-main">
                                    <%#Eval("magiamgia_name") %>
                                </p>
                                <p class="textmgg">
                                    <%#Convert.ToDateTime(Eval("magiamgia_ngaybatdau")).ToShortDateString()%> -  <%#Convert.ToDateTime(Eval("magiamgia_ngayketthuc")).ToShortDateString()%>
                                </p>
                            </div>
                            <a href="#" id="btnChon" onclick="myChon( <%#Eval("magiamgiacuakhachhang_id") %>)">Chọn</a>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        
        <div style="display:none">
            <input type="text" id="txtMaVach" runat="server" />
            <a href="#" id="btnLuu" runat="server" onserverclick="btnLuu_ServerClick"></a>
        </div>
    </div>
</asp:Content>

