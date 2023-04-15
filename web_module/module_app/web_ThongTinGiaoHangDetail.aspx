<%@ Page Title="" Language="C#" MasterPageFile="~/AppMasterPage.master" AutoEventWireup="true" CodeFile="web_ThongTinGiaoHangDetail.aspx.cs" Inherits="web_module_module_app_web_ThongTinGiaoHangDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css/footer.css" rel="stylesheet" />
    <link href="../../css/css-Linh/ttghdetail.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <div class="navabar">
        <a href="Default.aspx"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
        <div class="tieude"><span>THÊM ĐỊA CHỈ MỚI</span></div>
    </div>
    <div class="base">
        <p class="text-ttgh">Thông tin người nhận</p>
        <input class="input-ttgh" type="text" name="a" autocomplete="off" placeholder="Họ tên khách hàng" value="" />
        <hr class="abc" />
        <input class="input-ttgh" type="text" name="b" autocomplete="off" placeholder="Số điện thoại" value="" />
        <p class="text-ttgh">Địa chỉ giao hàng</p>
        <input class="input-ttgh" type="text" name="c" autocomplete="off" placeholder="Quận/Huyện" value="" />
        <hr class="abc" />
        <input class="input-ttgh" type="text" name="d" autocomplete="off" placeholder="Phường/Xã" value="" />
        <hr class="abc" />
        <input class="input-ttgh" type="text" name="e" autocomplete="off" placeholder="Tên đường, toà nhà, số nhà" value="" />
        <p class="text-ttgh">Ghi chú</p>
        <input class="input-ttgh" type="text" name="f" autocomplete="off" placeholder="Ghi chú khi giao hàng" value="" />
    <a class="btnhoanthanh">Hoàn Thành</a>
    </div>
</asp:Content>

