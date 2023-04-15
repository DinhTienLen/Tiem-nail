<%@ page title="" language="C#" masterpagefile="~/AppMasterPage.master" autoeventwireup="true" codefile="web_GioiThieuBanBe.aspx.cs" inherits="web_module_module_app_web_GioiThieuBanBe" %>
<%@ Register Src="~/web_usercontrol/menu_header.ascx" TagPrefix="uc1" TagName="linqheader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css/css_GioiThieuBanBe.css" rel="stylesheet" />
    <link href="../../css/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="navabar">
        <a href="Default.aspx"><i class="fa fa-chevron-left" style="font-size: 41px" aria-hidden="true"></i></a>
        <span>GIỚI THIỆU BẠN BÈ</span>
        <div class="icon-infor">
            <uc1:linqheader runat="server" ID="linqheader" />
        </div>
    </div>
    <body>
        <div class="base">
            <div class="container_form">
                <section class="box_contain">
                    <div class="title"><h1 style="margin-top: 8%;">Nhận ngay 30,000 xu</h1></div>
                    <div class="content_share">
                        <p style="margin-top: 3%;">Mời bạn bè sử dụng ứng dụng </p>
                        <p style="margin-top: -2%;">để được giảm giá 30,000đ đơn hàng đầu tiên</p>
                        
                    </div>
                    <div class="images_coin">
                        <img src="web_module/images/image_GioiThieuBanBe/2c6b996da73bfe3b6ba799a464026c67.png" />
                    </div >
                        <h3>Mã giới thiệu:</h3>
                    <div class="share-now">
                        <div class="Code"><input value="KQPS-8DSK-GSIN-98HI"></div>
                        <div class="button"><a href="./">Chia sẻ ngay</a></div>
                    </div>
                </section>
            </div>
        </div>
    </body>
</asp:Content>

