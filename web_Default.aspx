<%@ Page Title="" Language="C#" MasterPageFile="~/WebSiteMasterPage.master" AutoEventWireup="true" CodeFile="web_Default.aspx.cs" Inherits="web_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--slide--%>
    <div class="hero">
        <div class="hero__slider owl-carousel">
            <div class="hero__items set-bg" style="background-image: url(web_image/hero-1.jpg)"></div>
            <div class="hero__items set-bg" style="background-image: url(web_image/banner_3_lam_nail_2.jpg)"></div>
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
                        <p>
                            My love of makeup started young while often sneaking into my mother’s makeup vanity and playing with various shades of lipstick, eyeshadow and blush. Makeup became a full blown obsession after four years of art school where I learned
                            to master the airbrush technique.
                        </p>
                        <a href="#" class="primary-btn">XEM THÊM</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="about__pic">
                        <img src="web_image/trangchu.jpg" alt="" data-pagespeed-url-hash="2562920791" onload="pagespeed.CriticalImages.checkImageForCriticality(this);">
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
                            <img src="web_image/nhat-da-1.jpg" alt="" data-pagespeed-url-hash="1221547530" onload="pagespeed.CriticalImages.checkImageForCriticality(this);">
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
                            <img src="web_image/thiet-ke-mong.jpg" alt="" data-pagespeed-url-hash="1516047451" onload="pagespeed.CriticalImages.checkImageForCriticality(this);">
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="services__item">
                        <div class="services__item__pic">
                            <img src="web_image/goi-dau.jpg" alt="" data-pagespeed-url-hash="1810547372" onload="pagespeed.CriticalImages.checkImageForCriticality(this);">
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
                            <img src="web_image/ngam-chan.jpg" alt="" data-pagespeed-url-hash="2105047293" onload="pagespeed.CriticalImages.checkImageForCriticality(this);">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="testimonial spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="testimonial__slider owl-carousel">
                        <div class="testimonial__item">
                            <div class="testimonial__item__icon">
                                <img src="web_image/dau-phay.png" alt="" data-pagespeed-url-hash="4045604849" onload="pagespeed.CriticalImages.checkImageForCriticality(this);">
                            </div>
                            <div class="testimonial__author">
                                <div class="testimonial__author__pic">
                                    <img src="web_image/avatar.jpg" alt="" data-pagespeed-url-hash="1828834360" onload="pagespeed.CriticalImages.checkImageForCriticality(this);">
                                </div>
                                <div class="testimonial__author__text">
                                    <h5>Danielle Benton</h5>
                                    <span>Blogger/Client</span>
                                </div>
                            </div>
                            <p>
                                Rachel you are so amazing at what you do! Thank you so much for everything! I felt so beautiful on our wedding day. Not only are you superwoman with a makeup brush, you are so lovely and such a delight to have around the morning
                                of the wedding!! Any bride would be very lucky to have you part of her big day, I am very grateful that you were part of mine
                            </p>
                        </div>
                        <div class="testimonial__item">
                            <div class="testimonial__item__icon">
                                <img src="web_image/dau-phay.png" alt="" data-pagespeed-url-hash="4045604849" onload="pagespeed.CriticalImages.checkImageForCriticality(this);">
                            </div>
                            <div class="testimonial__author">
                                <div class="testimonial__author__pic">
                                    <img src="web_image/avatar.jpg" alt="" data-pagespeed-url-hash="1828834360" onload="pagespeed.CriticalImages.checkImageForCriticality(this);">
                                </div>
                                <div class="testimonial__author__text">
                                    <h5>Dani Alves</h5>
                                    <span>Blogger/Client</span>
                                </div>
                            </div>
                            <p>
                                Rachel you are so amazing at what you do! Thank you so much for everything! I felt so beautiful on our wedding day. Not only are you superwoman with a makeup brush, you are so lovely and such a delight to have around the morning
                                of the wedding!! Any bride would be very lucky to have you part of her big day, I am very grateful that you were part of mine
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="work">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <div class="work__item large__item set-bg" style="background-image: url(web_image/nu-tinh.jpg)">
                                <div class="work__item__text">
                                    <h6>MẪU MÓNG NỮ TÍNH</h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="work__item set-bg" style="background-image: url(web_image/toi-gian.jpg)">
                                <div class="work__item__text">
                                    <h6>MẪU MÓNG TỐI GIẢN</h6>
                                </div>
                            </div>
                            <div class="work__item set-bg" style="background-image: url(web_image/de-thuong.jpg)">
                                <div class="work__item__text">
                                    <h6>MẪU MÓNG DỄ THƯƠNG</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="work__item large__item set-bg" style="background-image: url(web_image/co-dau.jpg)">
                        <div class="work__item__text">
                            <h6>MẪU MÓNG CÔ DÂU</h6>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <div class="work__item set-bg" style="background-image: url(web_image/thoi-thuong.jpg)">
                                <div class="work__item__text">
                                    <h6>MẪU MÓNG THỜI THƯỢNG</h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="work__item set-bg" style="background-image: url(web_image/doc-la.jpg)">
                                <div class="work__item__text">
                                    <h6>MẪU MÓNG LẠ</h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="work__item set-bg" style="background-image: url(web_image/mong-chan.jpg)">
                                <div class="work__item__text">
                                    <h6>MẪU MÓNG CHÂN</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <section class="latest-blog spad">
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-lg-6 text-center">
                    <div class="section-title">
                        <span>THÔNG TIN NỔI BẬT</span>
                        <h2>Cập nhật xu hướng</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="web_image/tin-tuc-1.jpg" alt="" data-pagespeed-url-hash="1593855082" onload="pagespeed.CriticalImages.checkImageForCriticality(this);">
                        </div>
                        <div class="blog__item__text">
                            <a href="#" class="blog__item__cat"><i class="fa fa-picture-o"></i></a>
                            <h4><a href="#">Tips From Makeup Artists You’ve Never Heard</a></h4>
                            <ul>
                                <li><span>Rosie Chapman</span></li>
                                <li>Jun 15, 2020</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="web_image/tin-tuc-2.jpg" alt="" data-pagespeed-url-hash="1888355003" onload="pagespeed.CriticalImages.checkImageForCriticality(this);">
                        </div>
                        <div class="blog__item__text">
                            <a href="#" class="blog__item__cat"><i class="fa fa-file-text-o"></i></a>
                            <h4><a href="#">Everything I Learned From A Professional Makeup Artist</a></h4>
                            <ul>
                                <li><span>Rosie Chapman</span></li>
                                <li>Jun 15, 2020</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="web_image/tin-tuc-3.jpg">
                        </div>
                        <div class="blog__item__text">
                            <a href="https://www.youtube.com/watch?v=Pkh8UtuejGw" class="blog__item__cat video-popup"><i class="fa fa-play"></i></a>
                            <h4><a href="#">10 Makeup-Artist Tips That Surprised (and Delighted) Us</a></h4>
                            <ul>
                                <li><span>Rosie Chapman</span></li>
                                <li>Jun 15, 2020</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
                <div class="col-lg-12" style="text-align: center">
                    <div class="more__btn"><a href="#">View more posts</a></div>
                </div>
            </div>
    </section>
    <section class="beauty-products spad">
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-lg-6 text-center">
                    <div class="section-title">
                        <span>Beauty Products</span>
                        <h2>Beauty products</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="product__slider owl-carousel">
                    <div class="col-lg-3">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" style="background-image:url(web_image/son.jpg)">
                                <div class="product__item__hover">
                                    <ul>
                                        <li><a href="#"><i class="fa fa-shopping-bag"></i></a><span>Add to Cart</span></li>
                                        <li><a href="#"><i class="fa fa-eye"></i></a><span>Keep an eye</span></li>
                                        <li><a href="#"><i class="fa fa-heart"></i></a><span>Love this</span></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="product__item__text">
                                <span>Palettes</span>
                                <h6><a href="#">Leather shopper bag</a></h6>
                                <div class="price">$49.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" style="background-image:url(web_image/son.jpg)">
                                <div class="product__item__hover">
                                    <ul>
                                        <li><a href="#"><i class="fa fa-shopping-bag"></i></a><span>Add to Cart</span></li>
                                        <li><a href="#"><i class="fa fa-eye"></i></a><span>Keep an eye</span></li>
                                        <li><a href="#"><i class="fa fa-heart"></i></a><span>Love this</span></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="product__item__text">
                                <span>Palettes</span>
                                <h6><a href="#">Leather shopper bag</a></h6>
                                <div class="price">$49.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" style="background-image:url(web_image/son.jpg)">
                                <div class="product__item__hover">
                                    <ul>
                                        <li><a href="#"><i class="fa fa-shopping-bag"></i></a><span>Add to Cart</span></li>
                                        <li><a href="#"><i class="fa fa-eye"></i></a><span>Keep an eye</span></li>
                                        <li><a href="#"><i class="fa fa-heart"></i></a><span>Love this</span></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="product__item__text">
                                <span>Palettes</span>
                                <h6><a href="#">Leather shopper bag</a></h6>
                                <div class="price">$49.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" style="background-image:url(web_image/son.jpg)">
                                <div class="product__item__hover">
                                    <ul>
                                        <li><a href="#"><i class="fa fa-shopping-bag"></i></a><span>Add to Cart</span></li>
                                        <li><a href="#"><i class="fa fa-eye"></i></a><span>Keep an eye</span></li>
                                        <li><a href="#"><i class="fa fa-heart"></i></a><span>Love this</span></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="product__item__text">
                                <span>Palettes</span>
                                <h6><a href="#">Leather shopper bag</a></h6>
                                <div class="price">$49.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" style="background-image:url(web_image/son.jpg)">
                                <div class="product__item__hover">
                                    <ul>
                                        <li><a href="#"><i class="fa fa-shopping-bag"></i></a><span>Add to Cart</span></li>
                                        <li><a href="#"><i class="fa fa-eye"></i></a><span>Keep an eye</span></li>
                                        <li><a href="#"><i class="fa fa-heart"></i></a><span>Love this</span></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="product__item__text">
                                <span>Palettes</span>
                                <h6><a href="#">Leather shopper bag</a></h6>
                                <div class="price">$49.00</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="more__btn"><a href="#">VIEW ALL PRODUCTS</a></div>
                </div>
            </div>
        </div>
    </section>
    <section class="callto">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 p-0">
                    <div class="callto__left set-bg" style="background-image:url(web_image/callto-text-bg.jpg)" >
                        <div class="callto__left__text">
                            <span>Book online for</span>
                            <h2>20% discount</h2>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 p-0">
                    <div class="callto__form set-bg" style="background-image:url(web_image/callto-quote-bg.jpg)" >
                        <h3>Get a quote</h3>
                        <form action="#">
                            <div class="row">
                                <div class="col-lg-6">
                                    <input type="text" placeholder="Name">
                                </div>
                                <div class="col-lg-6">
                                    <input type="text" placeholder="Number phone">
                                </div>
                                <div class="col-lg-6">
                                    <input type="text" placeholder="Email">
                                </div>
                                <div class="col-lg-6">
                                    <select>
                                        <option value="">Choose services</option>
                                        <option value="">Beauty</option>
                                    </select>
                                </div>
                                <div class="col-lg-12">
                                    <textarea placeholder="Your message"></textarea>
                                    <button type="button" class="site-btn">Book services</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
 
</asp:Content>

