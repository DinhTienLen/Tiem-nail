<%@ Page Title="" Language="C#" MasterPageFile="~/AppMasterPage.master" AutoEventWireup="true" CodeFile="web_ThongTinDonHang.aspx.cs" Inherits="web_module_module_app_abc" %>

<%@ Register Src="~/web_usercontrol/menu_header.ascx" TagPrefix="uc1" TagName="linqheader" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css/footer.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <style>
        html {
            background-color: #F4F1F1;
        }


        body {
            padding: 0;
            margin: 0;
        }

        .base {
            OVERFLOW: AUTO;
            width: 100%;
            PADDING-TOP: 10%;
        }

        .tab-mgg {
            font-size: 45px;
        }

        .nav-item {
            margin: 15px 15px 0px 0px;
        }

        .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
            background-color: white;
            color: #f75f9c;
            border: none;
            border-bottom: 8px solid #fbc4da;
        }

        nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link {
            color: grey;
            font-weight: 500;
        }

        .nav-tabs {
            border: none;
        }

        .nav {
            flex-wrap: nowrap;
        }

            .nav.nav-tabs.nav-fill {
                white-space: nowrap;
            }

        .tab-content {
            background-color: #F4F1F1;
        }

        .voucher-warp {
            display: flex;
        }

        .voucher-row {
            border: 5px solid #e173b1;
            height: 250px;
            margin: 20px 10px;
            border-left: none;
            position: relative;
        }

        .textdonhang {
            text-align: left;
            color: orangered;
            font-size: 50px;
            font-weight: 700;
            padding: 11px 0px 20px 23px;
            font-size: 45px;
            font-weight: 700;
            margin: auto;
        }

        .tab-donhang {
            font-size: 37px;
        }

        .content-donhang {
            max-height: 5000px;
            display: block;
            width: auto;
            background-color: white;
        }



        .slphanloai-donhang, donhang-detail {
            display: flex;
        }

        .img-donhang {
            width: 330px;
            height: 310px;
        }

        .sl-donhang, .dongia-donhang, .donhang-status, .tongtien-donhang {
            text-align: right;
        }

        .donhang-status {
            color: #ffcc35;
        }

        .ten-dichvu {
            font-size: 50px;
            margin-left: 20px;
        }

        .slphanloai-donhang {
            padding-top: 25px;
            padding-bottom: 55px;
        }

        .ten-donhang {
            word-wrap: break-word;
            overflow: hidden;
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 1;
        }

        .donhang-detailban {
            font-size: 40px;
            display: flex;
            margin: 20px 0px 10px 0px;
            font-weight: 500;
            color: white;
            background-color: #e84f6c;
        }

        .tenslphanloai {
            FONT-SIZE: 40PX;
        }

            .tenslphanloai p {
                font-weight: 600;
                padding: 2%;
            }

        .donhang-thanhtien {
            font-size: 40px;
            font-weight: 500;
            background-color: white;
            margin: 0;
            padding: 0;
        }

        .abc {
            border: 0;
            margin: 15px 50px;
            border-top: 3px solid rgba(0,0,0,.1);
        }

        .dongia-donhang, .tongtien-donhang {
            color: orange;
        }

        .donhang-empty {
            background-image: url(../images/img_ThongTinDonHang/donhangempty.png);
            height: 850px;
            width: -webkit-fill-available;
            max-block-size: max-content;
            background-position: center;
            background-repeat: no-repeat;
            background-size: 700px 525px;
            margin-left: 45px;
        }

        .donhang_choxacnhan {
            width: -webkit-fill-available;
        }

        .text-empty {
            text-align: center;
            font-size: 45px;
            font-weight: 600;
            color: #342c2f;
            position: relative;
            top: -18%;
        }

        .donhang-empty {
            background-size: revert;
            background-image: url(web_module/images/icon-chua-co-don-hang.png);
        }
    </style>
    <div class="navabar">
        <a href="Default.aspx"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
        <div class="tieude"><span>THÔNG TIN ĐƠN HÀNG</span></div>
        <div class="icon-infor">
            <uc1:linqheader runat="server" ID="linqheader" />
        </div>
    </div>
    <div class="base">
        <div class="tab-donhang">
            <ul class="nav nav-tabs nav-fill" id="myTab" role="tablist">
                <li class="nav-item" style="margin: 15px 15px 0px 0px;">
                    <a class="nav-link active show" id="tab-alldonhang" data-toggle="tab"
                        href="#content-alldonhang"
                        role="tab" aria-controls="content-alldonhang" aria-selected="true">Tất cả
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link " id="tab-choxacnhan" data-toggle="tab"
                        href="#content-choxacnhan"
                        role="tab" aria-controls="content-choxacnhan" aria-selected="false">Chờ xác nhận
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" id="tab-dahoanthanh" data-toggle="tab"
                        href="#content-dahoanthanh"
                        role="tab" aria-controls="content-dahoanthanh" aria-selected="false">Đã hoàn thành
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" id="tab-dahuy" data-toggle="tab"
                        href="#content-dahuy"
                        role="tab" aria-controls="content-dahuy" aria-selected="false">Đã huỷ
                    </a>
                </li>

            </ul>

        </div>
    </div>
    <div class="tab-detail">
        <div class="tab-content" id="myTabContent">
            <%--content tatcadonhang--%>
            <asp:Repeater ID="rpTatCa" runat="server">
                <ItemTemplate>
                    <div class="tab-pane fade active show" id="content-alldonhang"
                        role="tabpanel" aria-labelledby="tab-alldonhang">
                        <div class="container-fluid">
                            <div class="row content-donhang">
                                <div class="row donhang-detailban">
                                    <div class="col ten-dichvu">
                                        <%#Eval("hoadon_code") %>
                                    </div>
                                    <div class=" col donhang-status">
                                        <%#Eval("hoadon_tinhtrang") %>
                                    </div>
                                </div>
                                <div class="row donhang-detail">
                                    <div class="  col tenslgphanloai-donhang">
                                        <div class=" tenslphanloai ">
                                            <div>
                                                &nbsp;&nbsp; Tổng tiền:    <%#Eval("hoadon_tongtien", "{0:N0}") %>đ
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <a style="padding: 1%; font-size: 43px; font-weight: 600;"
                                    href="/thong-tin-bill-<%#Eval("hoadon_id") %>">&nbsp;&nbsp;Chi tiết đơn hàng</a>
                                <hr class="abc" />
                            </div>
                        </div>

                    </div>
                </ItemTemplate>
            </asp:Repeater>


            <%--content cho xac nhan--%>
            <asp:Repeater ID="rpChoXacNhan" runat="server">
                <ItemTemplate>
                    <div class="tab-pane fade" id="content-choxacnhan"
                        role="tabpanel" aria-labelledby="tab-choxacnhan">
                        <%--<p class="textdonhang">
                    Chờ xác nhận
                </p>--%>
                        <div class="container-fluid">
                            <div class="row content-donhang">
                                <div class="row donhang-detailban">
                                    <div class="col ten-dichvu">
                                        <%#Eval("hoadon_code") %>
                                    </div>
                                    <div class=" col donhang-status">
                                        <%#Eval("hoadon_tinhtrang") %>
                                    </div>
                                </div>

                                <hr class="abc" />
                                <div class="row donhang-thanhtien">
                                    <div class="col tongtien-donhang">
                                        &nbsp;&nbsp; Tổng tiền:    <%#Eval("hoadon_tongtien", "{0:N0}") %>đ
                                    </div>
                                </div>
                                <a style="padding: 1%; font-size: 43px; font-weight: 600;" href="/thong-tin-bill-<%#Eval("hoadon_id") %>">chi tiết đơn hàng</a>
                            </div>
                        </div>

                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <%--content don hoan thanh--%>
            <asp:Repeater ID="rpDaHoanThanh" runat="server">
                <ItemTemplate>
                    <div class="tab-pane fade" id="content-dahoanthanh"
                        role="tabpanel" aria-labelledby="tab-dahoanthanh">
                        <%--<p class="textdonhang">
                    Đơn đã hoành thành
                </p>--%>
                        <div class="container-fluid">
                            <div class="row content-donhang">
                                <div class="row donhang-detailban">
                                    <div class="col ten-dichvu">
                                        <%#Eval("hoadon_code") %>
                                    </div>
                                    <div class=" col donhang-status">
                                        <%#Eval("hoadon_tinhtrang") %>
                                    </div>
                                </div>

                                <hr class="abc" />
                                <div class="row donhang-thanhtien">
                                    <div class="col tongtien-donhang">
                                        &nbsp;&nbsp; Tổng tiền:    <%#Eval("hoadon_tongtien", "{0:N0}") %>đ
                                    </div>
                                </div>
                                <a style="padding: 1%; font-size: 43px; font-weight: 600;" href="/thong-tin-bill-<%#Eval("hoadon_id") %>">chi tiết đơn hàng</a>
                            </div>
                        </div>

                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <%--content da huy --%>
            <asp:Repeater ID="rpDaHuy" runat="server">
                <ItemTemplate>
                    <div class="tab-pane fade" id="content-dahuy"
                        role="tabpanel" aria-labelledby="tab-dahuy">
                        <%--<p class="textdonhang">
                    Đơn đã huỷ
                </p>--%>
                        <div class="container-fluid">
                            <div class="row content-donhang">
                                <div class="row donhang-detailban">
                                    <div class="col ten-dichvu">
                                        <%#Eval("hoadon_code") %>
                                    </div>
                                    <div class=" col donhang-status">
                                        <%#Eval("hoadon_tinhtrang") %>
                                    </div>
                                </div>

                                <hr class="abc" />
                                <div class="row donhang-thanhtien">
                                    <div class="col tongtien-donhang">
                                        &nbsp;&nbsp; Tổng tiền:    <%#Eval("hoadon_tongtien", "{0:N0}") %>đ
                                    </div>
                                </div>
                                <a style="padding: 1%; font-size: 43px; font-weight: 600;" href="/thong-tin-bill-<%#Eval("hoadon_id") %>">chi tiết đơn hàng</a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>

