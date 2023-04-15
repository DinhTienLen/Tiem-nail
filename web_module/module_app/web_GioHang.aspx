<%@ Page Title="" Language="C#" MasterPageFile="~/AppMasterPage.master" AutoEventWireup="true" CodeFile="web_GioHang.aspx.cs" Inherits="web_module_module_app_web_GioHang" %>

<%@ Register Src="~/web_usercontrol/menu_header.ascx" TagPrefix="uc1" TagName="linqheader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../css/footer.css" rel="stylesheet" />
    <link href="../../css_Quy/css_GioHang.css" rel="stylesheet" />
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
    <div class="navabar">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <a href="Default.aspx"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
        <div class="tieude"><span>GIỎ HÀNG</span></div>
        <div class="icon-infor">
            <uc1:linqheader runat="server" ID="linqheader1" />
        </div>
    </div>
    <div class="base-tong">
        <asp:ScriptManager ID="scrGioHang" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="upGioHang" runat="server">
            <ContentTemplate>
                <asp:Repeater runat="server" ID="rpNails">
                    <ItemTemplate>
                        <div class="base">
                            <div style="display: flex; width: 100%;">
                                <img class="img-1" src="<%#Eval("sanpham_image") %>" />
                                <div style="display: flex; flex-direction: column;">
                                    <b class="block_Nailboxmau678"><%#Eval("sanpham_name") %></b>
                                    <b style="font-size: 42px;"><%#Eval("thanhtien", "{0:N0}") %>đ</b>
                                    <section style="display: flex">
                                        <div>
                                            <input type="radio" id="control_01" class="fa-solid fa-check" name="select" value="1" checked>
                                            <label for="control_01">
                                                <h4>S</h4>
                                            </label>
                                        </div>
                                        <div>
                                            <input type="radio" id="control_02" name="select" value="2" checked>
                                            <label for="control_02">
                                                <h4>M</h4>
                                            </label>
                                        </div>
                                        <div>
                                            <input type="radio" id="control_03" name="select" value="3" checked>
                                            <label for="control_03">
                                                <h4>L</h4>
                                            </label>
                                        </div>
                                    </section>
                                    <input type="number" id="txtSoLuong" onchange="mySoLuong(<%#Eval("hoadonchitiet_id") %>,this.value)" style="margin: 5% 0; font-size: 30px; width: 187px;" name="name" value="<%#Eval("hoadonchitiet_soluong") %>" />
                                    <%-- <input type="number" style="margin: 5% 0; font-size: 30px; width: 187px;" name="name" value="1" />--%>
                                </div>
                                <p style="font-size: 30px;"><%#Eval("sanpham_new") %></p>
                                <div class="block-check">
                                    <a href="#" id="btnXoa" onclick="myXoaSanPham(<%#Eval("hoadonchitiet_id") %>)"><i class="fa fa-times-circle-o" aria-hidden="true"></i></a>
                                    <%--  <i class="fa fa-check" aria-hidden="true"></i>--%>
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
                <div class="block-gia">
                    <%--<div class="block-gift">Đã chọn <i>1</i></div>--%>
                    <div id="block_chuyenkhoan" runat="server">
                        <a href="/chuyen-khoan" class="block-gift">
                            <span>Vui lòng chuyển khoản trước cho sala</span>
                            <i class="fa fa-angle-right" aria-hidden="true"></i>
                            <%--<span style="color: green;">Đã chọn</span>--%>
                        </a>
                    </div>
                    <a href="/kho-ma-giam-gia-gio-hang" class="block-gift">
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
                    <a href="#" class="block-gift">
                        <span style="color: black">Địa chỉ</span>
                        <input style="width: 50%; font-size: 30px" type="text" id="txtDiaChi" runat="server" name="name" />
                    </a>
                    <div class="block-tinhtien">
                        <span>Tổng tiền</span>
                        <span style="color: red; font-weight: 600;"><%=TienTong %></span>
                        <a href="#" id="btnBookLich" runat="server" onserverclick="btnBookLich_ServerClick" style="width: 20%; display: flex; justify-content: center;" class="button_dat">Đặt hàng</a>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    ipt>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</asp:Content>

