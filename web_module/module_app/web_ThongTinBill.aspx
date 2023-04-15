<%@ Page Title="" Language="C#" MasterPageFile="~/AppMasterPage.master" AutoEventWireup="true" CodeFile="web_ThongTinBill.aspx.cs" Inherits="web_module_module_app_web_DatLich" %>

<%@ Register Src="~/web_usercontrol/menu_header.ascx" TagPrefix="uc1" TagName="linqheader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css_Lai/css_DatLich2.css" rel="stylesheet" />
    <link href="../../css/footer.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="navabar">
        <a href="/thong-tin-don-hang"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
        <div class="tieude"><span>THÔNG TIN ĐƠN HÀNG</span></div>
        <div class="icon-infor">
            <uc1:linqheader runat="server" ID="linqheader" />
        </div>
    </div>
    <div class="base">
        <asp:Repeater ID="rpHoaDon" runat="server">
            <ItemTemplate>
                <div class="container_form">
                    <div class="table1">
                        <div class="block-menu2">
                            <span>Ngày</span>
                            <span><%#Eval("hoadon_createdate") %></span>
                        </div>
                    </div>
                    <hr />
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <div class="container_table2">
            <asp:Repeater ID="rpHoaDonChiTiet" runat="server">
                <ItemTemplate>
                    <div class="block-menu">
                        <span><%#Eval("sanpham_name") %></span>
                        <span><%#Eval("hoadonchitiet_soluong") %></span>
                        <span><%#Eval("thanhtien", "{0:N0}") %>đ</span>
                    </div>
                </ItemTemplate>
            </asp:Repeater>


        </div>
        <asp:Repeater ID="rpHoaDonTongTien" runat="server">
            <ItemTemplate>
                <div class="container_footer">
                    <div class="footer-bottom">
                        <span>Mã giảm giá</span>
                        <span style="color: gray"><span><%#Eval("hoadon_magiamgia", "{0:N0}") %>%</span>
                    </div>
                    <div class="footer-bottom">
                        <span>Tổng tiền</span>
                        <span style="color: gray"><span><%#Eval("hoadon_tongtien", "{0:N0}") %>đ</span>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <%-- <span class="thongtin">chờ xác nhận....</span>--%>
        <%--<a href="#" style="width: 100%; display: flex; justify-content: center;">
        <button class="button_dat">Đặt Lại</button></a>--%>
    </div>
</asp:Content>

