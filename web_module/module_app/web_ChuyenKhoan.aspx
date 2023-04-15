<%@ Page Title="" Language="C#" MasterPageFile="~/AppMasterPage.master" AutoEventWireup="true" CodeFile="web_ChuyenKhoan.aspx.cs" Inherits="web_module_module_app_web_ChuyenKhoan" %>

<%@ Register Src="~/web_usercontrol/menu_header.ascx" TagPrefix="uc1" TagName="linqheader" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css_Quy/css_ChonSanPham.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .infor-sala {
            margin: 6%;
            font-size: 41px;
            background-color: white;
            display: flex;
            padding: 3%;
            box-shadow: 7px 6px 36px 10px #80808038;
            border-radius: 4px;
            flex-direction: column;
            justify-content: center;
            width: 90%;
            font-weight: 600;
            line-height: 96px;
            height: 35rem;
        }

            .infor-sala div {
                border-bottom: 1px solid #80808052;
                display: flex;
                justify-content: space-between;
            }

        .infor {
            font-weight: 400;
        }

        .block-chuyen {
            overflow: hidden;
            height: 1000vh;
            background: aliceblue;
            display: flex;
            display: flex;
            justify-content: flex-start;
            flex-direction: column;
            align-items: center;
        }

        .tai-hinh {
            text-align: center;
            font-size: 40px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

            .tai-hinh img {
                width: 20rem;
            }

        .luu {
            background-color: #0f84eb;
            font-size: 53px;
            width: 20%;
            color: white;
            margin: 3%;
            border-radius: 6px;
            box-shadow: 4px 1px 10px 1px #80808059;
            font-weight: 600;
            text-align: center;
        }
    </style>
    <div class="navabar" style="position: unset">
        <a href="/gio-hang"><i style="font-size: 41px" class="fa fa-chevron-left" aria-hidden="true"></i></a>
        <div class="tieude"><span>CHUYỂN KHOẢN</span></div>
        <div class="icon-infor">
            <uc1:linqheader runat="server" ID="linqheader" />
        </div>
    </div>
    <div class="block-chuyen">
        <div class="infor-sala">
            <div>Số tài khoản <span class="infor">040095284797</span></div>
            <div>Chủ tài khoản <span class="infor">NGUYỄN HOÀNG LAN</span></div>
            <div>Ngân Hành <span class="infor">Sacombank</span></div>
            <div>Mã hóa đơn <span class="infor"><%=MaHoaDon %></span></div>
            <div>Tổng bill <span style="color: red"><%=TienTong %></span></div>

        </div>
        <div class="tai-hinh">
            <asp:FileUpload CssClass="hidden-xs-up" ID="FileUpload1" runat="server" onchange="showPreview1(this)" />
            <button type="button" class="btn-chang" onclick="clickavatar1()">
                <img id="imgPreview1" src="/admin_images/Preview-icon.png" style="width: 100%" />
            </button>
            <span>Vui lòng tải hình ảnh chuyển khoản</span>
        </div>
        <a class="luu" href="#" id="btnLuu" runat="server" onserverclick="btnLuu_ServerClick">Lưu</a>
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

