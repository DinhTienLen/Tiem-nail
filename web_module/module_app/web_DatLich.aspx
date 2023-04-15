<%@ Page Title="" Language="C#" MasterPageFile="~/AppMasterPage.master" AutoEventWireup="true" CodeFile="web_DatLich.aspx.cs" Inherits="web_module_module_app_web_DatLich" %>

<%@ Register Src="~/web_usercontrol/menu_header.ascx" TagPrefix="uc1" TagName="linqheader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css_Lai/css_DatLich.css" rel="stylesheet" />
    <link href="../../css/footer.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="../../admin_js/sweetalert.min.js"></script>
    <script>
        function myXoaSanPham(id) {
            document.getElementById("<%=txtIDChiTiet.ClientID%>").value = id;
            document.getElementById("<%=btnXoaSanPham.ClientID%>").click();
        }

        function mySoLuong(id, soluong) {
            document.getElementById("<%=txthdctid.ClientID%>").value = id;
            document.getElementById("<%=txtSoLuongSanPham.ClientID%>").value = soluong;
            document.getElementById("<%=btnCapNhatGiaTien.ClientID%>").click();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .block-menu i {
            font-size: 52px;
            /* margin: 0px; */
            padding: -8px;
            color: #e84f69;
        }

        .block-ten {
            font-size: 40px;
            display: -webkit-box;
            width: 28rem;
            -webkit-line-clamp: 1;
            -webkit-box-orient: vertical;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        * {
            font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol"
        }
    </style>
    <div class="navabar">
        <a href="Default.aspx"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
        <div class="tieude"><span>ĐẶT LỊCH</span></div>
        <div class="icon-infor">
            <uc1:linqheader runat="server" ID="linqheader1" />
        </div>
    </div>
    <div class="base">
        <div class="container_form">
           
            <div class="table1">
                <div class="block-menu2">
                    <span>Ngày</span>
                    <span>
                        <input class="tbdb" type="date" id="txtNgay" runat="server" /></span>
                </div>
                <div class="block-menu2">
                    <span>Thời gian</span>
                    <span>
                        <input id="txtThoiGian" runat="server" class="tbdb" type="time" /></span>
                </div>
                <div class="block-menu2">
                    <span>Số lượng khách hàng</span>
                    <input type="number" id="txtSoLuongKhachHang" runat="server" name="name" value="1" />
                </div>
            </div>
            <hr />
        </div>
        <div class="block-btn">
            <a href="/menu-dich-vu-dat-lich" style="width: 100%; display: flex; justify-content: center;">
                <span class="button_dichvu">Dịch vụ</span></a>
            <a href="/chon-san-pham" style="width: 100%; display: flex; justify-content: center;">
                <span class="button_mau">Mẫu nails</span></a>
        </div>
        <asp:ScriptManager ID="scrTongTien" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="upList" runat="server">
            <ContentTemplate>
                <div class="container_table2">

                    <asp:Repeater ID="rpListDatLich" runat="server">
                        <ItemTemplate>
                            <div class="block-menuchinh">
                                <div class="block-menu">
                                    <div style="display: flex">
                                        <span style="width: 58px; font-weight: 600; color: #e7475a;">1)</span>
                                        <span class="block-ten"><%#Eval("sanpham_name") %></span>
                                    </div>
                                    <input type="number" id="txtSoLuong" onchange="mySoLuong(<%#Eval("hoadonchitiet_id") %>,this.value)" name="name" value="<%#Eval("hoadonchitiet_soluong") %>" />
                                    <span style="width: 136px; font-weight: 600"><%#Eval("thanhtien", "{0:N0}") %>đ</span>
                                    <a href="#" id="btnXoa" onclick="myXoaSanPham(<%#Eval("hoadonchitiet_id") %>)"><i class="fa fa-times-circle-o" aria-hidden="true"></i></a>
                                </div>
                                <div id="modal<%#Eval("hoadonchitiet_id") %>" class="w3-modal" onclick="this.style.display='none'">
                                    <div class="w3-modal-content w3-animate-zoom">
                                        <img src="../../<%#Eval("hoadonchitiet_image") %>" />
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <div style="display: none">
                        <input type="text" id="txthdctid" runat="server" />
                        <input type="text" id="txtSoLuongSanPham" runat="server" />
                        <a href="#" id="btnCapNhatGiaTien" runat="server" onserverclick="btnCapNhatGiaTien_ServerClick"></a>

                        <input type="text" id="txtIDChiTiet" runat="server" />
                        <a href="#" id="btnXoaSanPham" runat="server" onserverclick="btnXoaSanPham_ServerClick"></a>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="upTongTien" runat="server">
            <ContentTemplate>
                <div class="container_footer">
                    <a href="/kho-ma-giam-gia-dat-lich" class="footer-top">
                        <span style="color: black">Chọn mã giảm giá</span>
                        <i class="fa fa-angle-right" aria-hidden="true"></i>
                        <div style="display: none">
                            <asp:Label ID="lblVourcher" runat="server"></asp:Label>
                        </div>
                    </a>
                    <div class="footer-bottom">
                        <span style="color: black">Giảm:  </span>
                        <span style="color: #ff0909">
                            <asp:Label ID="lblPercent" runat="server"></asp:Label>%</span>
                    </div>
                    <%-- <div style="display: none">
                        <input type="text" runat="server" id="txtIdMaVach" />
                        <a href="#" id="btnMaVach" runat="server" onserverclick="btnMaVach_ServerClick"></a>
                    </div>--%>
                    <div class="footer-bottom">
                        <span>Tổng tiền</span>
                        <span style="color: #ff0909"><%=TienTong %></span>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <a href="#" id="btnBookLich" runat="server" onserverclick="btnBookLich_ServerClick" style="width: 100%; display: flex; justify-content: center;" class="button_dat">Đặt lịch</a>
    </div>
</asp:Content>

