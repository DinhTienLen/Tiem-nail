<%@ Page Title="" Language="C#" MasterPageFile="~/AppMasterPage.master" AutoEventWireup="true" CodeFile="web_GioiThieu.aspx.cs" Inherits="web_module_module_app_web_GioiThieu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css_Lai/css_GioiThieu.css" rel="stylesheet" />
    <link href="../../css/style.css" rel="stylesheet" />
    <link href="../../css/footer.css" rel="stylesheet" />
    <link href="../../OwlCarousel2-2.3.4/dist/assets/owl.carousel.min.css" rel="stylesheet" />
    <link href="../../OwlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css" rel="stylesheet" />
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/jquery.min.js"></script>
    <script src="../../js/owl.carousel.min.js"></script>
    <script src="../../js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="../../OwlCarousel2-2.3.4/dist/owl.carousel.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="navabar" style="position: unset">
        
        <div class="tieude"><span>GIỚI THIỆU</span></div>
    </div>
        <div class="base">
            <div class="container_form">
                <div class="container_slider_left">
                    <img src="../../app_image/Longin/longin_logo.png" />
                    <div class="slider_left_thongtinlienhe">
                        <h5>THÔNG TIN LIÊN HỆ SALA</h5>
                        <div>
                            <img src="../../app_image/GioiThieu/icon_dienthoai.png" />
                            <span>0999052999</span>
                        </div>
                        <div>
                            <img src="../../app_image/GioiThieu/vitri.png" />
                            <span>121 Lê Duẩn, Đà Nẵng</span>
                        </div>
                        <div>
                            <img src="../../app_image/GioiThieu/vitri.png" />
                            <span>49 Huyền Trần,ĐN</span>
                        </div>
                        <div>
                            <img src="../../app_image/GioiThieu/email.png" />
                            <span>salabeauty@gmail.com</span>
                        </div>
                        <div>
                            <img src="../../app_image/GioiThieu/trangchu.png" />
                            <span>www.salanail.com</span>
                        </div>
                    </div>
                    <div class="slider_left_theodoitoi">
                        <h5>THEO DÕI TÔI</h5>
                        <div class="icon_theodoi">
                            <img src="../../app_image/GioiThieu/icon_fb.png" />
                            <img src="../../app_image/GioiThieu/icon_intagam.png" />
                            <img src="../../app_image/GioiThieu/youtube.png" />
                        </div>
                    </div>
                    <div class="slider_left_kynang">
                        <h5>KỸ NĂNG</h5>
                    </div>
                </div>
                <div class="container_slider_right">
                    <div class="slider_right_hinhanhkhachhang">
                        <div class="hinhanhkhachhang_header">
                            <img src="../../app_image/GioiThieu/kimcuong.png" />
                            <span>Hình ảnh khách hàng</span>
                        </div>
                        <div class="hinhanhkhachhang_img">
                            <div class="owl-carousel" >
                                <img src="../../app_image/GioiThieu/hinhanh_khachhang1.png" />
                                <img src="../../app_image/GioiThieu/hinhanh_khachhang2.png" />
                            </div>
                            <div style="position: relative">
                                <b style="position: absolute; top: 0; left: 0; z-index: 9999; width: auto;">></b>
                            </div>
                        </div>
                        <div class="slider_right_danhgiakhachhang">
                            <div class="hinhanhkhachhang_header">
                                <img src="../../app_image/GioiThieu/kimcuong.png" />
                                <span>Đánh giá khách hàng</span>
                            </div>
                            <div class="hinhanhkhachhang_danhgia">
                                <img src="../../app_image/GioiThieu/khachhang_nenpng.png" />
                                <div class="danhgia_thongtin">
                                    <h4>Hoang_Lan</h4>
                                    <span>Đã sử dụng dịch vụ:<br />
                                    </span>
                                    <span>Làm móng ngâm chân thảo dược:<br />
                                    </span>
                                    <span>Dịch vụ quán rất phong phú<br />
                                    </span>
                                </div>
                                <img src="../../app_image/GioiThieu/sao.png" />
                            </div>
                            <div class="hinhanhkhachhang_danhgia">
                                <img src="../../app_image/GioiThieu/khachhang_nenpng.png" />
                                <div class="danhgia_thongtin">
                                    <h4>Hoang_Lan</h4>
                                    <span>Đã sử dụng dịch vụ:<br />
                                    </span>
                                    <span>Làm móng ngâm chân thảo dược:<br />
                                    </span>
                                    <span>Dịch vụ quán rất phong phú<br />
                                    </span>
                                </div>
                                <img src="../../app_image/GioiThieu/like.png" />
                            </div>
                            <div class="hinhanhkhachhang_danhgia">
                                <img src="../../app_image/GioiThieu/khachhang_nenpng.png" />
                                <div class="danhgia_thongtin">
                                    <h4>Hoang_Lan</h4>
                                    <span>Đã sử dụng dịch vụ:<br />
                                    </span>
                                    <span>Làm móng ngâm chân thảo dược:<br />
                                    </span>
                                    <span>Dịch vụ quán rất phong phú<br />
                                    </span>
                                </div>
                                <img src="../../app_image/GioiThieu/sao.png" />
                            </div>
                            <div class="hinhanhkhachhang_danhgia">
                                <img src="../../app_image/GioiThieu/khachhang_nenpng.png" />
                                <div class="danhgia_thongtin">
                                    <h4>Hoang_Lan</h4>
                                    <span>Đã sử dụng dịch vụ:<br />
                                    </span>
                                    <span>Làm móng ngâm chân thảo dược:<br />
                                    </span>
                                    <span>Dịch vụ quán rất phong phú<br />
                                    </span>
                                </div>
                                <img src="../../app_image/GioiThieu/like.png" />
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <script>
                $(document).ready(function () {
                    $(".owl-carousel").owlCarousel(
                        {
                            items: 1,
                            loop: true,
                            margin: 10,
                            autoplay: true,
                            autoplayTimeout: 3000,
                            autoplayHoverPause: true
                        }
                    );
                });
            </script>
            <div class="owl-carousel">
                <div style="position: relative">
                    <p style="position: absolute; top: 0; left: 0; z-index: 9999; width: auto;">Sala Nail And Beauty - Cs1</p>
                    <img src="../../App_image/GioiThieu/coso1.png" />
                </div>
                <div style="position: relative">
                    <p style="position: absolute; top: 0; left: 0; z-index: 9999; width: auto;">Sala Nail And Beauty - Cs1</p>
                    <img src="../../App_image/GioiThieu/coso1.1.jpg" />
                </div>
                <div style="position: relative">
                    <p style="position: absolute; top: 0; left: 0; z-index: 9999; width: auto;">Sala Nail And Beauty - Cs2</p>
                    <img src="../../App_image/GioiThieu/Shop-Nail-2.1.jpg" />
                </div>
                <div style="position: relative">
                    <p style="position: absolute; top: 0; left: 0; z-index: 9999; width: auto;">Sala Nail And Beauty - Cs2</p>
                    <img src="../../App_image/GioiThieu/shop-nail-2.2.jpg" />
                </div>
            </div>
</asp:Content>

