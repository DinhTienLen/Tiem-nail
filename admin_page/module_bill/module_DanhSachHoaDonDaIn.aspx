<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="module_DanhSachHoaDonDaIn.aspx.cs" Inherits="admin_page_module_bill_module_DanhSachHoaDonDaIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headlink" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="hihead" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="himenu" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="hibodyhead" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="hibodywrapper" Runat="Server">
    <div class="card card-block">
        <div class="form-group row">
            <h3 class="text-sm-center">Danh sách hóa đơn đã in</h3>
           <%-- <div class="col-sm-12">
                <asp:UpdatePanel ID="udButton" runat="server">
                    <ContentTemplate>
                        <div class="col-lg-12">
                            <asp:Button ID="btnThem" runat="server" Text="Thêm" CssClass="btn btn-primary" OnClick="btnThem_Click" />
                            <asp:Button ID="btnChiTiet" runat="server" Text="Chi tiết" CssClass="btn btn-primary" OnClick="btnChiTiet_Click" />
                            <asp:Button ID="btnXacNhan" runat="server" Text="Xác nhận" CssClass="btn btn-primary" OnClick="btnXacNhan_Click" />
                            <div style="display: none">
                                <input type="submit" class="btn btn-primary" value="Xóa" onclick="confirmDel()" />
                                <asp:Button ID="btnXoa" runat="server" CssClass="invisible" OnClick="btnXoa_Click" />
                            </div>
                            <asp:Button ID="btnPrint" runat="server" Text="In bill" CssClass="btn btn-primary" OnClick="btnPrint_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>--%>
        </div>
    </div>
    <div class="form-group table-responsive">
        <dx:ASPxGridView ID="grvList" runat="server" CssClass="table-hover" ClientInstanceName="grvList" KeyFieldName="hoadon_id" Width="100%">
            <Columns>
                <dx:GridViewCommandColumn ShowSelectCheckbox="True" SelectAllCheckboxMode="Page" VisibleIndex="0" Width="9%"></dx:GridViewCommandColumn>
                <dx:GridViewDataColumn Caption="Tên khách hàng" FieldName="hoadon_TenKhachHang" HeaderStyle-HorizontalAlign="Center" Width="9%"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Mã hóa đơn" FieldName="hoadon_code" HeaderStyle-HorizontalAlign="Center" Width="9%"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Ngày tạo" FieldName="hoadon_createdate" HeaderStyle-HorizontalAlign="Center" Width="9%"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Số điện thoại" FieldName="hoadon_sodienthoaikhachhang" HeaderStyle-HorizontalAlign="Center" Width="9%"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Địa chỉ giao hàng" FieldName="hoadon_diachigiaohang" HeaderStyle-HorizontalAlign="Center" Width="9%"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Tình trạng" FieldName="hoadon_tinhtrang" HeaderStyle-HorizontalAlign="Center" Width="9%"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Loại thanh toán" FieldName="hoadontam_LoaiThanhToan" HeaderStyle-HorizontalAlign="Center" Width="9%"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Phần trăm giảm giá" FieldName="hoadon_magiamgia" HeaderStyle-HorizontalAlign="Center" Width="9%"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Tổng bill" FieldName="hoadon_tongtien" HeaderStyle-HorizontalAlign="Center" Width="9%">
                    <DataItemTemplate>
                        <%#Eval("hoadon_tongtien", "{0:N0}") %>
                    </DataItemTemplate>
                </dx:GridViewDataColumn>
                 <dx:GridViewDataColumn Caption="Phải trả" FieldName="hoadon_phaitra" HeaderStyle-HorizontalAlign="Center" Width="9%">
                    <DataItemTemplate>
                        <%#Eval("hoadon_phaitra", "{0:N0}") %>
                    </DataItemTemplate>
                </dx:GridViewDataColumn>
            </Columns>
            <SettingsSearchPanel Visible="true" />
            <SettingsBehavior AllowFocusedRow="true" />
            <SettingsText EmptyDataRow="Trống" SearchPanelEditorNullText="Gỏ từ cần tìm kiếm và enter..." />
            <SettingsLoadingPanel Text="Đang tải..." />
            <SettingsPager PageSize="10" Summary-Text="Trang {0} / {1} ({2} trang)"></SettingsPager>
        </dx:ASPxGridView>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="hibodybottom" Runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="hifooter" Runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="hifootersite" Runat="Server">
</asp:Content>

