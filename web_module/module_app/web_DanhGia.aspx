<%@ Page Title="" Language="C#" MasterPageFile="~/AppMasterPage.master" AutoEventWireup="true" CodeFile="web_DanhGia.aspx.cs" Inherits="web_module_module_app_web_DanhGia" %>

<%@ Register Src="~/web_usercontrol/menu_header.ascx" TagPrefix="uc1" TagName="linqheader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css/footer.css" rel="stylesheet" />
    <link href="../../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../css/css_DanhGiaChiTiet2.css" rel="stylesheet" />
    <link href="../fontasome/fontawesome-free-6.1.1-web/css/all.css" rel="stylesheet" />
    <link href="../../css/Rating.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .rating-stars {
            /* width: 35px; */
            display: flex;
            border-radius: 5vmin;
            position: relative;
            justify-content: center;
        }

        .submit_rate_form {
            margin: 14%;
            display: block;
            width: 95%;
            height: 53rem;
            background: #f2c5c5;
            border-radius: 20px;
        }

        label {
            width: 12vmin;
            height: 12vmin;
            background: #e74960;
            display: inline-flex;
            cursor: pointer;
            margin: 0.5vmin 0.65vmin;
            transition: all 1s ease 0s;
            clip-path: polygon(50% 0%, 66% 32%, 100% 38%, 78% 64%, 83% 100%, 50% 83%, 17% 100%, 22% 64%, 0 38%, 34% 32%);
        }
    </style>
    <div class="navabar">
        <a href="/danh-gia-san-pham"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
        <div class="tieude"><span>ĐÁNH GIÁ</span></div>
        <div class="icon-infor">
            <uc1:linqheader runat="server" ID="linqheader" />
        </div>
    </div>
    <div class="base">
        <div class="container_form">
            <div class="submit_rate_form">
                <div class="iconic">
                    <p>Hoàng Lan</p>
                </div>
                <div class="col-12">
                    <textarea placeholder="Nhập nội dung..." class="input_rate_box"></textarea>
                </div>
                <%--<div>
                        <h2>Hãy bình chọn cho sala bạn nhé !</h2>
                        <div class="rate_selection">
                            
                            <label class="container img_rate">
                                <img src="../images/image_DanhGiaChiTiet/sao.png" />
                                <h4>Chuyên nghiệp</h4>
                                <input type="radio" checked="checked" name="radio">
                                <span class="checkmark"></span>
                            </label>
                            
                            <label class="container img_rate">
                                <img src="../images/image_DanhGiaChiTiet/like.png" />
                                <h4>Tuyệt vời</h4> 
                                <input type="radio" checked="checked" name="radio">
                                <span class="checkmark"></span>
                            </label>

                            <label class="container img_rate">
                                <img class="attention" src="../images/image_DanhGiaChiTiet/tim.png" />
                                <h4>Ân cần</h4>
                                <input type="radio" checked="checked" name="radio">
                                <span class="checkmark"></span>
                            </label>
                            
                            <label class="container img_rate">
                                <img src="../images/image_DanhGiaChiTiet/meman.png" />
                                <h4>Mê mẩn</h4>  
                                <input type="radio" checked="checked" name="radio">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                    </div>--%>
                <h2>Hãy bình chọn cho sala bạn nhé !</h2>
                <div class="rating-stars">
                    <input type="radio" name="rating" id="rs0001" checked="checked"><label for="rs0001"></label>
                    <input type="radio" name="rating" id="rs0002"><label for="rs0002"></label>
                    <input type="radio" name="rating" id="rs0003"><label for="rs0003"></label>
                    <input type="radio" name="rating" id="rs0004"><label for="rs0004"></label>
                    <input type="radio" name="rating" id="rs0005"><label for="rs0005"></label>
                    <%--<span class="rating-counter"></span>--%>
                </div>
                <%--<div>
                        <div class="container">
                            <input type="checkbox" id="cbtest" />
                            <label for="cbtest" class="check-box"></label>
                        </div>
                        <div>
                            <img class="img_rate" src="../images/image_DanhGiaChiTiet/sao.png" />
                            <h2>Tuyệt vời</h2>
                        </div>
                    </div>--%>
            </div>
            <a class="submit_rate">
                <p>GỬI</p>
            </a>
        </div>

    </div>
</asp:Content>

