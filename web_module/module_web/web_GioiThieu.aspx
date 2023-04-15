<%@ Page Title="" Language="VB" MasterPageFile="~/WebSiteMasterPage.master" AutoEventWireup="false" CodeFile="web_GioiThieu.aspx.vb" Inherits="web_module_module_web_web_GioiThieu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .newslatter__form input {
            width: 100%;
            height: 50px;
            border: 1px solid #fff;
            border-radius: 50px;
            background: rgba(0, 0, 0, 0.6);
            font-size: 15px;
            color: #ffffff;
            padding-left: 40px;
        }

        .newslatter__form button {
                    font-size: 15px;
    color: #e65783;
    font-weight: 500;
    background: #ffffff;
    letter-spacing: 2px;
    text-transform: uppercase;
    border: none;
    border-radius: 50px;
    padding: 0 30px;
    position: absolute;
    top: 25%;
    right: 29%;
    height: 76%;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="breadcrumb-option set-bg" style="background-image: url(../../web_image/header/gioi-thieu.jpg)">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h2>SALA ĐÂY !</h2>
                        <div class="breadcrumb__links">
                            <a href="./index.html">Home</a>
                            <span>About</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <section class="about spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="about__text">
                        <div class="section-title">
                            <span>CHĂM SÓC SẮC ĐẸP CỦA BẠN</span>
                            <h2>Vì sao bạn tin tưởng tôi</h2>
                        </div>
                        <p>My love of makeup started young while often sneaking into my mother’s makeup vanity and playing with various shades of lipstick, eyeshadow and blush. Makeup became a full blown obsession after four years of art school where I learned to master the airbrush technique.</p>
                        <a href="#" class="primary-btn">Contact us</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="about__pic">
                        <img src="../../web_image/trangchu.jpg">
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section class="services set-bg spad">
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-lg-6 text-center">
                    <div class="section-title">
                        <span>DỊCH VỤ TẠI SALA</span>
                        <h2>Dịch vụ nổi bật</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="services__item">
                        <div class="services__item__pic">
                            <img src="../../web_image/nhat-da-1.jpg">
                        </div>
                        <div class="services__item__text">
                            <h5>NHẬT DA</h5>
                            <span>TỪ 15.000 VNĐ</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="services__item services__item__top">
                        <div class="services__item__text">
                            <h5>THIẾT KẾ MÓNG</h5>
                            <span>TỪ 69.000 VNĐ</span>
                        </div>
                        <div class="services__item__pic">
                            <img src="../../web_image/thiet-ke-mong.jpg">
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="services__item">
                        <div class="services__item__pic">
                            <img src="../../web_image/goi-dau.jpg">
                        </div>
                        <div class="services__item__text">
                            <h5>GỘI ĐẦU THƯ GIÃN</h5>
                            <span>TỪ 25.000 VNĐ</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="services__item services__item__top">
                        <div class="services__item__text">
                            <h5>NGÂM CHÂN THẢO DƯỢC</h5>
                            <span>TỪ 80.000 VNĐ</span>
                        </div>
                        <div class="services__item__pic">
                            <img src="../../web_image/ngam-chan.jpg">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="newslatter set-bg" style="background-image: url(../../web_image/header/dang-ki.jpg)">
        <div class="container">
            <div class="row">
                <div class="col-lg-12" style="text-align: center">
                    <div class="newslatter__text">
                        <h2>Hãy để Sala giải đáp thắc mắc cho bạn </h2>
                    </div>
                </div>
                <div class="col-lg-12" style="padding: 0 30%;">
                    <div class="newslatter__form">
                        <form action="#">
                            <input type="text" placeholder="Email">
                            <button type="submit">SỐ ĐIỆN THOẠI</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
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

