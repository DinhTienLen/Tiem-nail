<%@ Page Title="" Language="C#" MasterPageFile="~/AppMasterPage.master" AutoEventWireup="true" CodeFile="web_MaGiamGia.aspx.cs" Inherits="web_module_module_app_accc" %>
<%@ Register Src="~/web_usercontrol/menu_header.ascx" TagPrefix="uc1" TagName="linqheader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css/footer.css" rel="stylesheet" />
    <link href="../../css_Lai/magiamgia.css" rel="stylesheet" />
     <script src="../../admin_js/sweetalert.min.js"></script>
    <script>
        function myLuuMa(id) {
            document.getElementById("<%=txtMaCode.ClientID%>").value = id;
            document.getElementById("<%=btnLuu.ClientID%>").click();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
    <script src="../../js/jquery-3.3.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="../../admin_js/sweetalert.min.js"></script>
    <style>
        .nav-tabs .nav-link.active {
            background-color: white;
            color: #e74c65;
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
    </style>
    <%--banner--%>
    <div class="navabar">
        <a href="Default.aspx"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
        <div class="tieude"><span>MÃ GIẢM GIÁ</span></div>
        <div class="icon-infor">
            <uc1:linqheader runat="server" ID="linqheader" />
        </div>
    </div>

    <div class="base">
        <%--tab mgg--%>
        <div class="tab-mgg">
            <ul class="nav nav-tabs nav-fill" id="myTab" role="tablist">
                <li class="nav-item" style="margin: 15px 15px 0px 0px;">
                    <a class="nav-link active show" id="tab-javascript" data-toggle="tab"
                        href="#content-javascript"
                        role="tab" aria-controls="content-javascript" aria-selected="true">Mã giảm giá mới
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="tab-css" data-toggle="tab"
                        href="#content-css"
                        role="tab" aria-controls="content-css" aria-selected="false">Kho mã giảm giá
                    </a>
                </li>
            </ul>
            <%--content mgg--%>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade active show" id="content-javascript"
                    role="tabpanel" aria-labelledby="tab-javascript">
                    <p class="textmgg1">
                        Mã giảm giá dịch vụ tại Sala Beauty
                    </p>
                    <%--phieu mgg o day--%>
                    <div class="container-fluid">
                        <asp:Repeater ID="rpSalaBeauty" runat="server">
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
                                         
                                            <br />
                                            <%#Convert.ToDateTime(Eval("magiamgia_ngaybatdau")).ToShortDateString()%> -  <%#Convert.ToDateTime(Eval("magiamgia_ngayketthuc")).ToShortDateString()%>
                                        </p>
                                        <a onclick="myLuuMa(<%#Eval("magiamgia_id") %>)" id="btnmgg1" class="btn btn-primary btnluumgg " >Lưu mã
                                        </a>
                                        <%--thanhbar--%>
                                        <div class=" w3-round-xlarge thanhbar">
                                            <div class="w3-container w3-round-xlarge barpercen" <%#Eval("magiamgia_phantram") %>></div><%--width: 25%--%>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <%--phieu mgg thu 2--%>
                    <p class="textmgg2">
                        Mã giảm giá mua hàng online
                    </p>

                    <div class="container-fluid">
                        <asp:Repeater ID="rpOnline" runat="server">
                            <ItemTemplate>
                                <div class="row voucher-row">
                                    <div class="col-3 voucher-left">
                                        <div class="border-rangcua2">
                                        </div>
                                        <div class="content-vcleft2">
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
                                        <a id="btnmgg2" onclick="myLuuMa(<%#Eval("magiamgia_id") %>)" class="btn btn-primary btnluumgg ">Lưu mã
                                        </a>
                                        <%--thanhbar--%>
                                        <div class=" w3-round-xlarge thanhbar">
                                            <div class="w3-container w3-round-xlarge barpercen" <%#Eval("magiamgia_phantram") %>></div>
                                        </div>

                                    </div>

                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <%--kho mgg--%>

                <div class="tab-pane fade" id="content-css"
                    role="tabpanel" aria-labelledby="tab-css">
                    <p class="textmgg1">
                        Mã giảm giá dịch vụ tại Sala Beauty
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

                                </div>
                            </ItemTemplate>
                        </asp:Repeater>



                    </div>
                    <p class="textmgg2">
                        Mã giảm giá mua hàng online
                    </p>
                    <div class="container-fluid">
                        <asp:Repeater ID="rpMaKhachHangOnline" runat="server">
                            <ItemTemplate>
                                <div class="row voucher-row">

                                    <div class="col-3 voucher-left">
                                        <div class="border-rangcua2">
                                        </div>
                                        <div class="content-vcleft2">
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
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <div style="display: none">
                            <input type="text" id="txtMaCode" runat="server" />
                            <a href="#" id="btnLuu" runat="server" onserverclick="btnLuu_ServerClick"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

