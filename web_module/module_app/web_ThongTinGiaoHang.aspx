<%@ Page Title="" Language="C#" MasterPageFile="~/AppMasterPage.master" AutoEventWireup="true" CodeFile="web_ThongTinGiaoHang.aspx.cs" Inherits="web_module_module_app_ThongTinGiaoHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css/footer.css" rel="stylesheet" />
    <link href="../../css/css-Linh/ttgh.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/55af28d6d7.js" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <div class="navabar">
        <a href="Default.aspx"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
        <div class="tieude"><span>THÔNG TIN GIAO HÀNG</span></div>
    </div>
    <div class="base">
        <label class="box-diachi">
            <div class="box">
                <div class="head-box">
                    Nguyễn Hoàng Lan <%--<span class="status-box">[Mặc Định]</span>--%>
                </div>
                <div class="body-box">
                    <p>
                        0335696383 
                    </p>
                    <p>k251/2 Huyền Trân Công Trúa</p>
                    <p>Phường Mỹ An,Quận Ngũ Hành Sơn,Đè Nẽng</p>
                </div>
            </div>
            <input type="radio" id="age1" name="age" value="30" checked="checked"/>
            <span class="checkmark"></span>
        </label>
        <label class="box-diachi">
            <div class="box">
                <div class="head-box">
                    Nguyễn Hoàng Lan 
                </div>
                <div class="body-box">
                    <p>
                        0335696383 
                    </p>
                    <p>k251/2 Huyền Trân Công Trúa</p>
                    <p>Phường Mỹ An,Quận Ngũ Hành Sơn,Đè Nẽng</p>
                </div>
            </div>
            <input type="radio" id="age2" name="age" value="30" />
            <span class="checkmark"></span>
        </label>
        <label class="box-diachi">
            <div class="box">
                <div class="head-box">
                    Nguyễn Hoàng Lan 
                </div>
                <div class="body-box">
                    <p>
                        0335696383 
                    
                    </p>
                    <p>k251/2 Huyền Trân Công Trúa</p>
                    <p>Phường Mỹ An,Quận Ngũ Hành Sơn,Đè Nẽng</p>
                </div>
            </div>
            <input type="radio" id="age3" name="age" value="30" />
            <span class="checkmark"></span>
            <%--<div class="spacebtwbox">
                <br />
            </div>--%>
        </label>
        <div class="themdiachimoi">
            <div class="box">
                <p class="head-box">
                    Thêm địa chỉ mới 
                <a>
                    <i class="fa-solid fa-plus icon-plus"></i>
                </a>
                </p>
            </div>


        </div>
        <%--<div class="btn-suadiachi">
            <p><i class="fa-regular fa-pen-to-square btn-sdc"></i></p>
        </div>--%>
    </div>
</asp:Content>
