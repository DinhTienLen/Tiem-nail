<%@ Page Title="" Language="C#" MasterPageFile="~/AppMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/web_usercontrol/menu_header.ascx" TagPrefix="uc1" TagName="linqheader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css/style.css" rel="stylesheet" />
    <link href="../../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../OwlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css" rel="stylesheet" />
    <%--<script src="../../js/bootstrap.min.js"></script>--%>
    <%--<script src="../../js/jquery.min.js"></script>--%>
    <script src="../../js/owl.carousel.min.js"></script>
    <script src="../../js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="../../OwlCarousel2-2.3.4/dist/owl.carousel.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        * {
            font-family: revert;
        }

        a:hover {
            text-decoration: unset;
        }

        img {
            margin-left: unset;
        }

        .base {
            background: #e91e630d;
            overflow-x: hidden;
            margin-top: 9%;
            padding-bottom: 24%;
            width: inherit;
        }

        .owl-carousel .owl-item img {
            object-fit: cover;
            height: 29rem;
        }

        .owl-theme .owl-nav.disabled + .owl-dots {
            position: inherit;
            margin-top: -45px;
        }

        .owl-theme .owl-dots .owl-dot {
            zoom: 2;
        }

            .owl-theme .owl-dots .owl-dot span {
                background: #ffffff;
            }

            .owl-theme .owl-dots .owl-dot.active span, .owl-theme .owl-dots .owl-dot:hover span {
                background: #ff0000;
            }

        .block-dichvu img {
            padding: 9%;
            margin: 13%;
            background: white !important;
            width: 69%;
            box-shadow: 8px 5px 20px -8px #cb98a9;
            border-radius: 25px;
        }

        .block-dichvu {
            text-align: center;
        }

            .block-dichvu a span {
                text-align: center;
                font-weight: 700;
                font-size: 33px;
                text-decoration: none !important;
                color: black;
            }

        .block-chinh {
            padding: 43px 0;
            background-color: #f8e17d45;
            margin: 5% 3% 3% 3%;
            box-shadow: 0px 7px 9px rgb(0 0 0 / 25%);
            border-radius: 6px;
        }

            .block-chinh a img {
                border-radius: 135px;
                width: 15rem;
                height: 15rem;
                object-fit: cover;
                box-shadow: 2px 8px 24px 1px #21252942;
            }

        .block-chinh2 {
            background-size: cover;
            background-image: url(App_image/block-chinh.png);
            padding: 43px 0;
            background-color: #ffffff;
            margin: 5% 3% 3% 3%;
            background-position: center;
            box-shadow: 0px 7px 9px rgb(0 0 0 / 25%);
            border-radius: 6px;
        }

            .block-chinh2 a img {
                border-radius: 30px;
                width: 15rem;
                height: 15rem;
                padding: unset;
                object-fit: cover;
                box-shadow: -9px 16px 23px #e3e4fe;
            }

        .title-chinh {
            width: 100%;
            text-align: -webkit-center;
        }

        .ten {
            background-color: #ff7f7f;
            font-weight: 700;
            color: white;
            padding: 3%;
            width: 57%;
            margin-top: 40px;
            position: relative;
            margin-bottom: -110px;
            font-size: 53px;
            border-radius: 15px;
        }

        .icon-infor i {
            padding: 0px 6%;
            color: white;
            font-size: 35px;
        }

        .icon-infor {
            width: 18%;
        }

        .dropdown-menu {
            font-size: 39px;
            height: 33rem;
            width: 42rem;
            position: absolute;
            transform: translate3d(-160px, 38px, 0px);
            text-align: end;
            top: 2px;
            left: -30rem;
            will-change: transform
        }

        .dropdown {
            text-align: center;
            margin-right: 12px;
        }
    </style>
    <div class="navabar">
        <span style="margin-left: 26%; margin-top: 19px;"><span style="font-family: 'Great Vibes'; font-size: 75px;">Sala</span><span style="margin-left: 25px; font-size: 42px;">NAILS & BEAUTY</span></span>
        <div class="icon-infor">
            <uc1:linqheader runat="server" ID="linqheader1" />
        </div>
    </div>
    <div class="base">
        <div class="owl-carousel owl-theme">
            <div class="item">
                <img src="App_image/Slide.jpg" />
            </div>
            <div class="item">
                <img src="App_image/Slide-1.jpg" />
            </div>
            <div class="item">
                <img src="App_image/Slide-2.jpg" />
            </div>
            <div class="item">
                <img src="App_image/Slide-3.jpg" />
            </div>
            <div class="item">
                <img src="App_image/Slide-4.jpg" />
            </div>
        </div>

        <div class="block-dichvu">
            <div class="row">
                <a href="/ma-qr" class="col-3">
                    <img class="pure-material-button-contained" src="App_image/icon/qr-code.jpg" />
                    <span>Mã QR</span>
                </a>
                <a href="/ma-giam-gia" class="col-3">
                    <img class="pure-material-button-contained" src="App_image/icon/discounts.jpg" />
                    <span>Giảm giá MỚI</span>
                </a>
                <a href="/tin-tuc-dich-vu" class="col-3">
                    <img class="pure-material-button-contained" src="App_image/icon/nail.jpg" />
                    <span>Dịch vụ</span>
                </a>
                <a href="/app-cap-nhat-xu-huong" class="col-3">
                    <img class="pure-material-button-contained" src="App_image/icon/diamond.jpg" />
                    <span>Xu hướng</span>
                </a>
            </div>
            <div class="row">
                <a href="/san-pham-dong-gia" class="col-3">
                    <img class="pure-material-button-contained" src="App_image/icon/69k.png" />
                    <span>Đồng giá 69k</span>
                </a>
                <a href="/thong-tin-chi-nhanh" class="col-3">
                    <img class="pure-material-button-contained" src="App_image/icon/living-room.jpg" />
                    <span>chi nhánh</span>
                </a>
                <a href="/thong-tin-don-hang" class="col-3">
                    <img class="pure-material-button-contained" src="App_image/icon/clock.jpg" />
                    <span>Thông tin bill</span>
                </a>
                <a href="/hom-thu" class="col-3">
                    <img class="pure-material-button-contained" src="App_image/icon/checklist.jpg" />
                    <span>Góp ý</span>
                </a>
            </div>
            <div class="title-chinh">
                <div class="ten">DỊCH VỤ TẠI SALA</div>
            </div>
            <div class="block-chinh2">
                <div class="row">
                    <a href="/menu-dich-vu" class="col-4">
                        <img class="pure-material-button-contained" src="App_image/icon/icon-dichvu.jpg" />
                        <span>Menu dịch vụ</span>
                    </a>
                    <a href="/album-nails" class="col-4">
                        <img class="pure-material-button-contained" src="App_image/icon/icon-album.jpg" />
                        <span>Album mẫu nails</span>
                    </a>

                    <a href="/hoa-don-dat-lich" class="col-4">
                        <img class="pure-material-button-contained" src="App_image/icon/icon-datlich2.jpg" />
                        <span>Đặt lịch</span>
                    </a>
                </div>
                <div class="row">
                    <a href="/ma-giam-gia" class="col-4">
                        <img class="pure-material-button-contained" src="App_image/icon/icon-vocher.jpg" />
                        <span>Mã giảm giá</span>
                    </a>
                    <a href="/nails-box" class="col-4">
                        <img class="pure-material-button-contained" src="App_image/icon/icon-nailbox.jpg" />
                        <span>Nails box</span>
                    </a>
                    <a href="/gioi-thieu-ban-be" class="col-4">
                        <img class="pure-material-button-contained " src="App_image/icon/icon-share.jpg" />
                        <span>Giới thiệu bạn bè</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('.owl-carousel').owlCarousel({
                autoplay: false,
                autoplayTimeout: 1000,
                loop: true,
                margin: 10,
                responsive: {
                    0: {
                        items: 1
                    },
                }
            })
        });
    </script>
</asp:Content>

