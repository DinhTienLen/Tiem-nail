<%@ Page Title="" Language="C#" MasterPageFile="~/AppMasterPage.master" AutoEventWireup="true" CodeFile="web_ChonSanPhamDichVu.aspx.cs" Inherits="web_module_module_app_web_ChonSanPham" %>
<%@ Register Src="~/web_usercontrol/menu_header.ascx" TagPrefix="uc1" TagName="linqheader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <script src="../../admin_js/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link href="../../css/footer.css" rel="stylesheet" />

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
    <link href="../../css_Quy/css_ChonSanPham.css" rel="stylesheet" />

        <%--banner--%>
        <div class="navabar" style="position: unset">
            <a href="/hoa-don-dat-lich"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
            <div class="tieude"><span>CHỌN SẢN PHẨM</span></div>
            <div class="icon-infor">
                <uc1:linqheader runat="server" ID="linqheader" />
            </div>
        </div>
        <div class="base">
            <a class="btn-chon-mau" href="/album-nails">Chọn mẫu trên Sala  </a>
         
            <div class="base-1">
                <ul class="nav nav-tabs nav-fill" id="myTab" role="tablist">
                    <li class="nav-item" style="margin: 15px 15px 0px 0px;">
                        <a class="nav-link" id="tab-javascript" data-toggle="tab"
                            href="#content-javascript"
                            role="tab" aria-controls="content-javascript" aria-selected="false">Tải lên
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" id="tab-css" data-toggle="tab"
                            href="#content-css"
                            role="tab" aria-controls="content-css" aria-selected="false">Lịch sử tải lên
                        </a>
                    </li>
                </ul>
                <div class="tab-mgg">

                    <%--content mgg--%>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade" id="content-javascript"
                            role="tabpanel" aria-labelledby="tab-javascript">
                            <%--<asp:Button Class="btn-taihinhlen" Text="Tải hình lên" runat="server" />

                            <div class="content-1">
                                <img class="img-1" src="web_module/images/image_CapNhatXuHuongChiTiet/09-mau-son-mong-tay-han-quoc.jpg" />
                                <div class="cont">
                                    <p class="ten-file">123.png</p>
                                    <p class="gia-tien">Giá tiền mong muốn:</p>
                                    <input class="nhap-gia" />
                                </div>
                            </div>--%>
                            <div class="col-12">
                                            
                                            <div class="colum-5 form-group">
                                                <label class="form-control-label">Hình ảnh :</label>
                                                <div id="up1" class="">
                                                    <asp:FileUpload CssClass="hidden-xs-up" ID="FileUpload1" runat="server" onchange="showPreview1(this)" />
                                                    <button type="button" class="btn-chang" onclick="clickavatar1()">
                                                        <img id="imgPreview1" src="/admin_images/Preview-icon.png" style="width: 100%" />
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <input hidden="hidden" type="text" id="txtImage" value="/admin_images/Preview-icon.png" runat="server" />
                            <div class="cont">
                                    <%--<p class="ten-file">123.png</p>--%>
                                <p class="gia-tien">Tên mẫu mong muốn:</p>
                                    <input type="text" id="txtTenMau" runat="server" class="" />
                                    <p class="gia-tien">Giá tiền mong muốn:</p>
                                    <input type="text" id="txtGiaTien" runat="server" class="" />
                                </div>
                        </div>
                        <%--kho mgg--%>

                        <div class="tab-pane fade" id="content-css"
                            role="tabpanel" aria-labelledby="tab-css">
                            <div class="gr-1 col-3">
                                <img class="img-2" src="web_module/images/image_CapNhatXuHuongChiTiet/son-mau-nude-ket-hop-van-da.jpg" />
                                <img class="img-2" src="web_module/images/image_CapNhatXuHuongChiTiet/son-mau-nude-ket-hop-van-da.jpg" />
                                <img class="img-2" src="web_module/images/image_CapNhatXuHuongChiTiet/son-mau-nude-ket-hop-van-da.jpg" />
                                <img class="img-2" src="web_module/images/image_CapNhatXuHuongChiTiet/son-mau-nude-ket-hop-van-da.jpg" />
                                <img class="img-2" src="web_module/images/image_CapNhatXuHuongChiTiet/son-mau-nude-ket-hop-van-da.jpg" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:Button Class="btn-themgiohang" ID="btnDatLich" Text="Đặt Lịch" runat="server" OnClick="btnDatLich_Click" />
            <%--tab mgg--%>
        </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script>

        function luumggoke() {
            document.getElementById("btnmgg1").textContent = abc;
        }
        function showPreview1(input) {
            if (input.files && input.files[0]) {
                var filerdr = new FileReader();
                filerdr.onload = function (e) {
                    $('#imgPreview1').attr('src', e.target.result);
                }
                filerdr.readAsDataURL(input.files[0]);
            }
        }
        function clickavatar1() {
            $("#up1 input[type=file]").click();
        }


    </script>
</asp:Content>

