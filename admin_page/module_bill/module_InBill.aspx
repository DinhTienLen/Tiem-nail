<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="module_InBill.aspx.cs" Inherits="admin_page_module_bill_module_InBill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headlink" runat="Server">
    <link href="../../admin_css/dat-lich.css" rel="stylesheet" />
    <script src="../../admin_js/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="hihead" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="himenu" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="hibodyhead" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="hibodywrapper" runat="Server">
    <script type="text/javascript">
        function PrintPanel() {
            var panel = document.getElementById("<%=pnlContents.ClientID %>");
            var printWindow = window.open('', 'heigh:800', 'width:1200');
            printWindow.document.write('<html><head><title>Sala Beauty</title>');
            printWindow.document.write('<html><head><link href="../../admin_css/dat-lich.css" rel="stylesheet" />');
            printWindow.document.write('</head><body >');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            setTimeout(function () {
                printWindow.print();
            }, 500);
            return false;
        }
    </script>
    <div style="display: flex; flex-direction: column;">
        <asp:Panel ID="pnlContents" runat="server">
            <div class="base col-6 col-md-12 col-sm-12" style="width: 240px; padding: 0;">
              <%-- style="margin-left: 10%;--%> <span><span style="font-family: 'GreatVibes-Regular'; font-size: 53px;    font-weight: 600;">Sala</span><span style="    font-size: 17px;    font-weight: 600;">NAILS & BEAUTY</span></span>
                <div class="block-diachi">
                    <span>Địa chỉ : 128/27 Huyền Trân Công Chúa, quận Ngũ Hành Sơn,tp Đà Nẵng</span>
                    <span>Sđt : 078 944 8907</span>
                </div>
                <div class="container_form">
                    <div class="table1">
                        <div class="block-menu2">
                            <span>Ngày</span>
                            <span>
                                <asp:Label class="tbdb" ID="lblNgay" runat="server" type="date" /></span>
                        </div>
                        <div class="block-menu2">
                            <span>Giờ vào</span>
                            <span>
                                <asp:Label ID="lblThoiGian" runat="server" class="tbdb" /></span>
                        </div>
                        <div style="display: none" class="block-menu2">
                            <span>Số lượng khách hàng</span>
                            <span>
                                <asp:Label ID="lblSoLuongKhachHang" runat="server" /></span>
                        </div>
                    </div>
                    <hr />


                    <div class="container_table2">
                        <div class="block-menuchinh">
                            <asp:Repeater ID="rpHoaDonChiTiet" runat="server">
                                <ItemTemplate>
                                    <div class="block-menu">
                                        <div style="font-size: 12px; display: flex;">
                                            <span style="width: 13px; font-weight: 600; color: #000000;"><%=STT++ %></span>
                                            <span class="block-ten"><%#Eval("sanpham_name") %></span>
                                        </div>
                                        <span class="block-giasp"><%#Eval("thanhtien", "{0:N0}") %>đ</span>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    <div class="container_footer">
                        <div class="footer-bottom">
                            <span>Tổng tiền</span>
                            <span style="color: #ff0909; font-size: 1rem;">
                                <asp:Label ID="lblTongTien" runat="server" /></span>
                        </div>
                        <div class="footer-bottom">
                            <span style="color: black">Giảm:  </span>
                            <span style="color: #ff0909">
                                <asp:Label ID="lblPercent" runat="server"></asp:Label>%</span>
                        </div>
                        <div class="footer-bottom">
                            <span>Tổng tiền phải trả</span>
                            <span style="color: #ff0909; font-size: 1.2rem;">
                                <asp:Label ID="lblTongTienPhaiTra" runat="server" /></span>
                        </div>
                    </div>
                </div>
                <div style="font-size: 11px; text-align: center; padding: 0 0 6% 0; font-weight: 600;">
                    <span>Cảm ơn quý khách đã đến với Sala</span>
                    <span>Hãy theo dõi chúng tôi tại fb: SALA NAILS & BEAUTY <i class="fa fa-heart" aria-hidden="true"></i></span>
                </div>

            </div>
        </asp:Panel>
        <asp:Button ID="btnPrint" runat="server" Text="Print" OnClientClick="return PrintPanel();" Style="width: 100%; display: flex; justify-content: center;" class="button_dat" />
        <asp:Button ID="btnXacNhan" runat="server" Text="Xác nhận" OnClick="btnXacNhan_Click" Style="width: 100%; display: flex; justify-content: center;" CssClass="btn btn-primary mt-1"/>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="hibodybottom" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="hifooter" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="hifootersite" runat="Server">
</asp:Content>

