<%@ Page Title="" Language="C#" MasterPageFile="~/AppMasterPage.master" AutoEventWireup="true" CodeFile="web_DanhGiaChiTiet.aspx.cs" Inherits="web_module_module_app_web_DanhGiaChiTiet" %>
<%@ Register Src="~/web_usercontrol/menu_header.ascx" TagPrefix="uc1" TagName="linqheader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css/style.css" rel="stylesheet" />
    <link href="../../css/footer.css" rel="stylesheet" />
    <link href="../../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../css/css_DanhGiaChiTiet.css" rel="stylesheet" />
    <link href="../fontasome/fontawesome-free-6.1.1-web/css/all.css" rel="stylesheet" />
    <script src="../../admin_js/sweetalert.min.js"></script>
    <script>
        function myLoai(id) {
         
            document.getElementById("<%=txtLoai.ClientID%>").value = id;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="navabar" >
        <a href="Default.aspx"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
        <div class="tieude"><span>HÒM THƯ GÓP Ý</span></div>
        <div class="icon-infor">
            <uc1:linqheader runat="server" ID="linqheader" />
        </div>
    </div>
    <div class="base">
        <div class="container_form">
            <div class="submit_rate_form">
                <div class="iconic">
                    <img class="rounded-circle image_sizing" src="../../App_image/Longin/longin_logo.png" />
                    <p>Hoàng Lan</p>
                </div>
                <div class="col-12">
                    <textarea placeholder="Nhập nội dung..." id="txtNoiDung" runat="server" class="input_rate_box"></textarea>
                </div>
                <h2>Hãy bình chọn cho sala bạn nhé !</h2>
                <section>
                    <div>
                        <input type="radio" id="control_01" class="fa-solid fa-check" name="select" value="1" checked>
                        <label for="control_01">
                            <h4>Chuyên nghiệp</h4>
                            <img class="img_rate" id="btnChuyenNghiep" onclick="myLoai('Chuyên nghiệp')" src="web_module/images/image_DanhGiaChiTiet/sao.png" />
                        </label>
                    </div>
                    <div>
                        <input type="radio" id="control_02" name="select" value="2">
                        <label for="control_02">
                            <h4>Tuyệt vời</h4>
                            <img class="img_rate" id="btnTuyetVoi" onclick="myLoai('Tuyệt vời')" src="web_module/images/image_DanhGiaChiTiet/like.png" />
                        </label>
                    </div>
                    <div>
                        <input type="radio" id="control_03" name="select" value="3">
                        <label for="control_03">
                            <h4>Ân cần</h4>
                            <img class="img_rate"  id="btnAnCan" onclick="myLoai('Ân cần')"  src="web_module/images/image_DanhGiaChiTiet/tim.png" />
                        </label>
                    </div>
                    <div>
                        <input type="radio" id="control_04" name="select" value="4">
                        <label for="control_04">
                            <h4>Mê mẩn</h4>
                            <img class="img_rate" id="btnMeMan" onclick="myLoai('Mê mẩn')"  src="web_module/images/image_DanhGiaChiTiet/meman.png" />
                        </label>
                    </div>
                </section>
                <div style="display:none">
                    <input type="text" id="txtLoai" runat="server"/>
                </div>
            </div>
            <a class="submit_rate" style="width: 40%;" id="btnGui" runat="server" onserverclick="btnGui_ServerClick">
                <p>GỬI</p>
            </a>
        </div>

    </div>
</asp:Content>

