<%@ Page Title="" Language="C#" MasterPageFile="~/AppMasterPage.master" AutoEventWireup="true" CodeFile="web_ThanhToan.aspx.cs" Inherits="web_module_module_app_web_ThanhToan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css/footer.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/55af28d6d7.js" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>


    <style>
        html {
            background-color: #F5F5F5;
        }

        .base {
            font-size: 40px;
            background-color: white;
            font-weight: 600;
        }

        .head-box {
            padding: 30px;
            position: relative;
        }

        .body-box {
            padding-left: 30px;
            color: slategray;
            position:relative;
        }
            .body-box p {
                margin-bottom: 5px;
            }

        .spacebtwbox {
            height: 35px;
            width: 100%;
            background-color: #F5F5F5;
        }
        .abc {
            border: 0;
            border-top: 3px solid rgba(0,0,0,.1);
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

        .donhang-detailban {
            font-size: 40px;
            display: flex;
            margin: 20px 0px 10px 0px;
            font-weight: 500;
            color: white;
            background-color: #e84f6c;
        }

        .ten-dichvu {
            font-size: 50px;
            margin-left: 20px;
        }

        .img-donhang {
            width: 330px;
            height: 310px;
            margin: 20px 0px 0px 10px;
        }

        .tenslphanloai {
            font-size: 40px;
        }

            .tenslphanloai p {
                font-weight: 700;
                padding: 0px 10px;
                margin: 0 10px;
                font-size: 50px;
            }

        .slphanloai-donhang, donhang-detail {
            display: flex;
        }

        .slphanloai-donhang {
        }

        .dongia-donhang, .donhang-status, .tongtien-donhang {
            text-align: right;
        }

        .dongia-donhang, .tongtien-donhang {
            color: orange;
            font-size: 50px;
        }
        .tongtien-donhang{
            margin: 0px 15px;
        }
        

        .tongsl-donhang {
            margin-left: 20px;
        }
        .phanloai-donhang {
            font-weight: 400;
            color: slategrey;
            font-size: 45px;
        }
        .icon-diachi {
            font-size: 70px;
            color: #f66794;
        }
        .icon-tabttghdetail {
            right: 3%;
            top: -9%;
            position: absolute;
            font-size: 75px;
            color: #f66794;
        }
    </style>

    <div class="navabar" style="position: unset">
        <a href="Default.aspx"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
        <div class="tieude"><span>Thanh Toán </span></div>
    </div>
    <div class="base">
        <div class="box-diachi">
            <div class="head-box">
                Địa chỉ giao hàng <i class="fa-solid fa-location-dot icon-diachi"></i> 
            </div>
            <div class="body-box">
                <p>
                    Nguyễn Hoàng Lan 0335696383 
                </p>
                <p>k251/2 Huyền Trân Công Trúa</p>
                <p>Phường Mỹ An,Quận Ngũ Hành Sơn,Đè Nẽng</p>
                <a href="#"><i class="fa-solid fa-angle-right icon-tabttghdetail" ></i></a>
            </div>
        </div>
        <div class="spacebtwbox">
            <br />
        </div>
        <div class="container-fluid">
            <div class="row content-donhang">
                <div class="row donhang-detailban">
                    <div class="col ten-dichvu">Dịch vụ</div>
                </div>
                <div class="row donhang-detail">
                    <div class="col-4 ">
                        <img class="img-donhang" src="../../App_image/Dung/mau-nails-box-chi-tiet/nail-xanh.jpg" />
                    </div>

                    <div class="  col tenslgphanloai-donhang">
                        <div class=" tenslphanloai ">
                            <div class="ten-donhang">
                                <p>
                                    Làm móng
                                </p>
                            </div>
                            <div class="allphanloai-donhang">
                                <div class="col slphanloai-donhang">
                                    <div class="phanloai-donhang">Dũa form móng</div>
                                </div>
                                <div class="col slphanloai-donhang">
                                    <div class="col sl-donhang">x1</div>
                                    <div class=" col dongia-donhang">10.000đ</div>
                                </div>
                            </div>
                            <div class="allphanloai-donhang">
                                <div class="col slphanloai-donhang">
                                    <div class="phanloai-donhang">Đắp móng giả</div>
                                </div>
                                <div class="col slphanloai-donhang">
                                    <div class="col sl-donhang">x1</div>
                                    <div class=" col dongia-donhang">80.000đ</div>
                                </div>
                            </div>

                        </div>

                            
                        </div>

                    </div>

                <hr class="abc" />
                
                <div class="row donhang-detail">
                    <div class="col-4 ">
                        <img class="img-donhang" src="../../App_image/Dung/mau-nails-box-chi-tiet/nail-xanh.jpg" />
                    </div>

                    <div class="  col tenslgphanloai-donhang">
                        <div class=" tenslphanloai ">
                            <div class="ten-donhang">
                                <p>
                                    Gội đầu
                                </p>
                            </div>
                            <div class="allphanloai-donhang">
                                <div class="col slphanloai-donhang">
                                    <div class="phanloai-donhang">Gội đầu thư giãn gội thường</div>
                                </div>
                                <div class="col slphanloai-donhang">
                                    <div class="col sl-donhang">x1</div>
                                    <div class=" col dongia-donhang">20.000đ</div>
                                </div>
                            </div>
                            <div class="allphanloai-donhang">
                                <div class="col slphanloai-donhang">
                                    <div class="phanloai-donhang">Ủ tóc chuyên sâu </div>
                                </div>
                                <div class="col slphanloai-donhang">
                                    <div class="col sl-donhang">x1</div>
                                    <div class=" col dongia-donhang">50.000đ</div>
                                </div>
                            </div>

                        </div>

                            
                        </div>

                    </div>

                </div>
                <hr class="abc" />
            </div>

        <div class="box-thanhtoan">
            <div class="row phivanchuyen">
                <div class="col tongsl-donhang">
                    Phí vận chuyển:
                </div>
                <div class="col tongtien-donhang">
                    15.000đ
                </div>
            </div>
            <div class="row donhang-thanhtien">
                <div class="col tongsl-donhang">
                    Tổng số tiền (4sp):
                </div>
                <div class="col tongtien-donhang">
                    175.000đ
                </div>
            </div>
        </div>
        </div>

    
</asp:Content>

