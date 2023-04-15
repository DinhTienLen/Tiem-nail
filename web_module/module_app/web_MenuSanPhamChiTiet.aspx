<%@ page title="" language="C#" masterpagefile="~/AppMasterPage.master" autoeventwireup="true" codefile="web_MenuSanPhamChiTiet.aspx.cs" inherits="web_module_module_app_web_menusanphamchitiet" %>
<%@ Register Src="~/web_usercontrol/menu_header.ascx" TagPrefix="uc1" TagName="linqheader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css/css_Ngan/css_MenuSanPhamChiTiet.css" rel="stylesheet" />
    <link href="../../css/footer.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="navabar" style="position: unset">
        <i class="fa fa-chevron-left" aria-hidden="true"></i>
        <div class="tieude"><span>ALBUM SẢN PHẨM</span></div>
        <div class="icon-infor">
            <uc1:linqheader runat="server" ID="linqheader" />
        </div>
    </div>
        <div class="base">
            <div class="container_list">
                <div class="nd">
                      
                   
                    <div class="nd-1">
                        <p class="txt-nd1">Mẫu tự chọn</p>
                    </div>
                    <div class="nd-2">
                        <p class="txt-nd2">Xem tất cả</p>
                    </div>
                </div>
                <div class="thanh"></div>
                <div class="box">
                <div class="block-nail">
                    <div class="box-1">
                        
                        <div class="img-1">

                            <div class="ribbon-wrapper"><div class="ribbon-pink">Mới</div></div>
                             <img class="img-1" src="../../App_image/MenuSanPhamChiTiet/menusanphamchitiet-1.png" />                         
                        </div>
                        <div class="nd">
                            <p class="txt-nd">Nail trong đính charm huyền bí</p>

                        </div>
                       

                        <div class="block-nd">
                            <p>
                                Đã đặt
                            </p>
                            <div class="block-thanh">
                                <p class="gach">|</p>
                            </div>
                            
                            <p>
                                Đã xem
                            </p>

                        </div>
                        <div class="bttn">
                            <button class="btn-dat" type="submit" name="Đặt">Đặt lịch ngay</button>

                        </div>
                        </div>
                     <div class="box-1">
                        
                        <div class="img">

                              <div class="ribbon-wrapper-1"><div class="ribbon-pink-1">Mới</div></div>

                            <img class="img-2" src="../../App_image/MenuSanPhamChiTiet/menusanphamchitiet-2.png" />

                        </div>
                        <div class="nd">
                            <p class="txt-nd">Nail đen huyền bí kết hợp charm nơ nữ tính</p>

                        </div>
                       

                        <div class="block-nd-1">
                            <p>
                                Đã đặt
                            </p>
                            <div class="block-thanh">
                                <p class="gach">|</p>
                            </div>
                            
                            <p>
                                Đã xem
                            </p>

                        </div>
                        <div class="bttn-1">
                            <button class="btn-dat" type="submit" name="Đặt">Đặt lịch ngay</button>

                        </div>
                        </div>

                    </div>
                    <div class="block-nail">
                    <div class="box-1">
                        <div class="img">

                            <img class="img-3" src="../../App_image/MenuSanPhamChiTiet/menusanphamchitiet-3.png" />                     

                        </div>
                        <div class="nd">
                            <p class="txt-nd">Nail trong đính charm huyền bí</p>

                        </div>
                       

                        <div class="block-nd-2">
                            <p>
                                Đã đặt
                            </p>
                            <div class="block-thanh">
                                <p class="gach">|</p>
                            </div>
                            
                            <p>
                                Đã xem
                            </p>

                        </div>
                        <div class="bttn-2">
                            <button class="btn-dat" type="submit" name="Đặt">Đặt lịch ngay</button>

                        </div>
                        </div>
                     <div class="box-1">
                        <div class="img">

                            <img class="img-4" src="../../App_image/MenuSanPhamChiTiet/menusanphamchitiet-4.png" />

                        </div>
                        <div class="nd">
                            <p class="txt-nd">Nail đen huyền bí kết hợp charm nơ nữ tính</p>

                        </div>
                       

                        <div class="block-nd-3">
                            <p>
                                Đã đặt
                            </p>
                            <div class="block-thanh">
                                <p class="gach">|</p>
                            </div>
                            
                            <p>
                                Đã xem
                            </p>

                        </div>
                        <div class="bttn-3">
                            <button class="btn-dat" type="submit" name="Đặt">Đặt lịch ngay</button>
                        </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
</asp:Content>

