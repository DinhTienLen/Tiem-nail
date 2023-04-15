<%@ Page Title="" Language="C#" MasterPageFile="~/AppMasterPage.master" AutoEventWireup="true" CodeFile="web_SanPhamDanhGia.aspx.cs" Inherits="web_module_module_app_web_SanPhamDanhGia" %>

<%@ Register Src="~/web_usercontrol/menu_header.ascx" TagPrefix="uc1" TagName="linqheader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../OwlCarousel2-2.3.4/dist/assets/owl.carousel.min.css" rel="stylesheet" />
    <link href="../../OwlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css" rel="stylesheet" />
    <link href="../../css/Rating.css" rel="stylesheet" />
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/jquery.min.js"></script>
    <script src="../../js/owl.carousel.min.js"></script>
    <script src="../../js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="../../OwlCarousel2-2.3.4/dist/owl.carousel.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        a{
            text-decoration: none;
        }
        a:hover{
            text-decoration: none;
        }
        .owl-carousel .owl-item img {
            display: block;
            width: 60rem;
            height: 50rem;
            object-fit: cover;
        }

        .owl-dots {
            position: inherit;
            margin-top: -55px;
        }

        .owl-theme .owl-dots .owl-dot {
            /* width: 26px; */
            display: inline-block;
            zoom: 2;
        }

        .owl-nav {
            display: none;
        }

        .owl-carousel {
            margin-top: 10%;
        }

        .owl-theme .owl-dots .owl-dot.active span, .owl-theme .owl-dots .owl-dot:hover span {
            background: #e85371;
        }
        .ten {
            font-size: 50PX;
            padding: 1%;
            font-weight: 600;
        }
    </style>
    <div class="navabar">
        <a href="Default.aspx"><i style="font-size: 41px" class="fa fa-chevron-left" aria-hidden="true"></i></a>
        <div class="tieude"><span style="margin-left: 9%;">SẢN PHẨM</span></div>
        <div class="icon-infor">
            <uc1:linqheader runat="server" ID="linqheader" />
        </div>
    </div>
    <div class="base">
        <div class="owl-carousel owl-theme">
            <div class="item">
                <img src="../../App_image/Dung/mau-nail-box/nu-tinh.jpg" />
            </div>
            <div class="item">
                <img src="../../App_image/Dung/mau-nail-box/tone-nau.jpg" />
            </div>
            <div class="item">
                <h4>3</h4>
            </div>
        </div>
        <div class="block-rating">
            <span class="ten">MH001</span>
            <div class="rating-stars">
                <input type="radio" name="rating" id="rs1"><label for="rs1"></label>
                <input type="radio" name="rating" id="rs2"><label for="rs2"></label>
                <input type="radio" name="rating" id="rs3"><label for="rs3"></label>
                <input type="radio" name="rating" id="rs4" checked="checked"><label for="rs4"></label>
                <input type="radio" name="rating" id="rs5"><label for="rs5"></label>
                <%--<span class="rating-counter"></span>--%>
            </div>
        </div>
        <div class="block-danhgia">
            <div style="display: flex; justify-content: space-between;">
                <span style="font-weight: 600; color: #e74960;">Thu Thủy</span>
                <div class="rating-stars">
                    <input type="radio" name="rating" id="rs01"><label for="rs01"></label>
                    <input type="radio" name="rating" id="rs02"><label for="rs02"></label>
                    <input type="radio" name="rating" id="rs03"><label for="rs03"></label>
                    <input type="radio" name="rating" id="rs04" checked="checked"><label for="rs04"></label>
                    <input type="radio" name="rating" id="rs05"><label for="rs05"></label>
                    <%--<span class="rating-counter"></span>--%>
                </div>
            </div>
            <span style="font-size: 28px; margin-top: -7px;">20/2/2022</span>
            <span>Đẹp lắm ạ !!!!!!!!!</span>
        </div>
        <div class="block-danhgia">
            <div style="display: flex; justify-content: space-between;">
                <span style="font-weight: 600; color: #e74960;">Nguyễn Lân</span>
                <div class="rating-stars">
                    <input type="radio" name="rating" id="rs001"><label for="rs001"></label>
                    <input type="radio" name="rating" id="rs002"><label for="rs002"></label>
                    <input type="radio" name="rating" id="rs003"><label for="rs003"></label>
                    <input type="radio" name="rating" id="rs004" checked="checked"><label for="rs004"></label>
                    <input type="radio" name="rating" id="rs005"><label for="rs005"></label>
                    <%--<span class="rating-counter"></span>--%>
                </div>
            </div>
            <span style="font-size: 28px; margin-top: -7px;">20/2/2022</span>
            <span>Khi nào rảnh sẽ ghé lại ạ, tiệm dễ thương lắm</span>
        </div>
        <div class="block-danhgia">
            <div style="display: flex; justify-content: space-between;">
                <span style="font-weight: 600; color: #e74960;">Như Ngọc</span>
                <div class="rating-stars">
                    <input type="radio" name="rating" id="rs0001"><label for="rs0001"></label>
                    <input type="radio" name="rating" id="rs0002"><label for="rs0002"></label>
                    <input type="radio" name="rating" id="rs0003"><label for="rs0003"></label>
                    <input type="radio" name="rating" id="rs0004" checked="checked"><label for="rs0004"></label>
                    <input type="radio" name="rating" id="rs0005"><label for="rs0005"></label>
                    <%--<span class="rating-counter"></span>--%>
                </div>
            </div>
            <span style="font-size: 28px; margin-top: -7px;">20/2/2022</span>
            <span>Mẫu này oke nè</span>
        </div>
        <a href="/danh-gia" class="block-comment">
            <span>ĐÁNH GIÁ NGAY</span>
        </a>
    </div>
    <script>
        $(document).ready(function () {
            $('.owl-carousel').owlCarousel({
                loop: true,
                margin: 10,
                nav: true,
                responsive: {
                    0: {
                        items: 1
                    },
                }
            })
        });
    </script>
</asp:Content>

