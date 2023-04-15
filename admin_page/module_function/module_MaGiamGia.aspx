<%@ Page Title="Quản lý mã giảm giá" Language="C#" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="module_MaGiamGia.aspx.cs" Inherits="admin_page_module_function_module_MaGiamGia" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v17.1" %>
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headlink" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="hihead" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="himenu" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="hibodyhead" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="hibodywrapper" runat="Server">
    <script type="text/javascript">
        function func() {
            grvList.Refresh();
            popupControl.Hide();
        }
        function btnChiTiet() {
            document.getElementById('<%=btnChiTiet.ClientID%>').click();
        }
        function popupHide() {
            document.getElementById('btnClosePopup').click();
        }
        function checkNULL() {
            var CityName = document.getElementById('<%= dteNgayBatDau.ClientID%>');
            var CityName2 = document.getElementById('<%= dteNgayKetThuc.ClientID%>');
            var CityName3 = document.getElementById('<%= txtsoluong.ClientID%>');

            if (CityName.value.trim() == "" || CityName2.value.trim() == "" || CityName2.value.trim() == "") {
                swal('Nhập đầy đủ thông tin !', '', 'warning').then(function () { CityName.focus(); });
                return false;
            }
            return true;
        }
        function confirmDel() {
            swal("Bạn có thực sự muốn xóa?",
                "Nếu xóa, dữ liệu sẽ không thể khôi phục.",
                "warning",
                {
                    buttons: true,
                    dangerMode: true
                }).then(function (value) {
                    if (value == true) {
                        var xoa = document.getElementById('<%=btnXoa.ClientID%>');
                        xoa.click();
                    }
                });
        }
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false; return true;
        }

        function showPreview(input) {
            if (input.files && input.files[0]) {
                var filerdr = new FileReader();
                filerdr.onload = function (e) {
                    $('#hibodywrapper_popupControl_imgPreview').attr('src', e.target.result);
                }
                filerdr.readAsDataURL(input.files[0]);
            }
        }
        //function showImg(img) {
        //    $('#hibodywrapper_popupControl_imgPreview').attr('src', img);
        //}
        function showPreview1(input) {
            if (input.files && input.files[0]) {
                var filerdr = new FileReader();
                filerdr.onload = function (e) {
                    $('#imgPreview1').attr('src', e.target.result);
                }
                filerdr.readAsDataURL(input.files[0]);
            }
        }
        function showImg1(img) {
            $('#hibodywrapper_imgPreview1').attr('src', img);
        }
        function showImg1_1(img) {
            $('#imgPreview1').attr('src', img);
        }
    </script>
    <div class="card card-block">
        <div class="form-group row">
            <div class="col-sm-10">
                <asp:UpdatePanel ID="udButton" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnThem" runat="server" Text="Thêm" CssClass="btn btn-primary" OnClick="btnThem_Click" />
                        <asp:Button ID="btnChiTiet" runat="server" Text="Chi tiết" CssClass="btn btn-primary" OnClick="btnChiTiet_Click" />
                        <div style="display:none">
                            <input type="submit" class="btn btn-primary" value="Xóa" onclick="confirmDel()" />
                            <asp:Button ID="btnXoa" runat="server" CssClass="invisible" OnClick="btnXoa_Click" />
                        </div>
                        User khách hàng :
                        <input type="text" id="txtKhachHang" runat="server" />
                        <asp:Button ID="btnGuiMaKhachHang" runat="server" OnClick="btnGuiMaKhachHang_Click" Text="Gửi mã" />
                    </ContentTemplate>
                </asp:UpdatePanel>

            </div>
        </div>
        <div>
        </div>
        <div class="form-group table-responsive">
            <dx:ASPxGridView ID="grvList" runat="server" ClientInstanceName="grvList" KeyFieldName="magiamgia_id" Width="100%">
                <Columns>
                    <dx:GridViewCommandColumn ShowSelectCheckbox="True" SelectAllCheckboxMode="Page" VisibleIndex="0" Width="2%">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataColumn Caption="Loại" FieldName="loaimagiamgia_name" HeaderStyle-HorizontalAlign="Center" Width="20%"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Nộ dung" FieldName="magiamgia_name" HeaderStyle-HorizontalAlign="Center" Width="20%"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Số lượng" FieldName="magiamgia_soluong" HeaderStyle-HorizontalAlign="Center" Width="20%"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="% giảm" FieldName="magiamgia_sogiam" HeaderStyle-HorizontalAlign="Center" Width="20%"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Ngày bắt đầu" FieldName="magiamgia_ngaybatdau" HeaderStyle-HorizontalAlign="Center" Width="20%"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Ngày kết thúc" FieldName="magiamgia_ngayketthuc" HeaderStyle-HorizontalAlign="Center" Width="20%"></dx:GridViewDataColumn>
                </Columns>
                <ClientSideEvents RowDblClick="btnChiTiet" />
                <SettingsSearchPanel Visible="true" />
                <SettingsBehavior AllowFocusedRow="true" />
                <SettingsText EmptyDataRow="Không có dữ liệu" SearchPanelEditorNullText="Gõ từ cần tìm kiếm và enter..." />
                <SettingsLoadingPanel Text="Đang tải..." />
                <SettingsPager PageSize="10" Summary-Text="Trang {0} / {1} ({2} trang)"></SettingsPager>
            </dx:ASPxGridView>
        </div>
    </div>
    <dx:ASPxPopupControl ID="popupControl" runat="server" Width="1000px" Height="600px" CloseAction="CloseButton" ShowCollapseButton="True" ShowMaximizeButton="True" ScrollBars="Auto" CloseOnEscape="true" Modal="True"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="popupControl" ShowFooter="true"
        HeaderText="Mã giảm giá" AllowDragging="True" PopupAnimationType="Fade" EnableViewState="False" AutoUpdatePosition="true" ClientSideEvents-CloseUp="function(s,e){grvList.Refresh();}">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <asp:UpdatePanel ID="udPopup" runat="server">
                    <ContentTemplate>
                        <div class="popup-main">
                            <div class="div_content col-12">
                                <div class="col-12">
                                    <div class="col-12">
                                        <div class="col-12 form-group">
                                            <label class="col-2 form-control-label">Loại mã giảm giá:</label>
                                            <div class="col-10">
                                                <dx:ASPxComboBox ID="ddlloaisanpham" runat="server" ValueType="System.Int32" TextField="loaimagiamgia_name" ValueField="loaimagiamgia_id" ClientInstanceName="ddlloaisanpham" CssClass="" Width="95%"></dx:ASPxComboBox>
                                            </div>
                                        </div>
                                        <div class="col-12 form-group">
                                            <label class="col-2 form-control-label">Nội dung :</label>
                                            <div class="col-10">
                                                <asp:TextBox ID="txttenmagiamgia" runat="server" ClientIDMode="Static" CssClass="form-control boxed" Width="98%"> </asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-12 form-group">
                                            <label class="col-2 form-control-label">% giảm:</label>
                                            <div class="col-10">
                                                <asp:TextBox ID="txtPhanTram" runat="server" ClientIDMode="Static" CssClass="form-control boxed" Width="98%"> </asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-12 form-group" id="div_soluong" runat="server">
                                            <label class="col-2 form-control-label">Số lượng mã trong đợt này cần tạo:</label>
                                            <div class="col-10">
                                                <asp:TextBox ID="txtsoluong" runat="server" ClientIDMode="Static" CssClass="form-control boxed" Width="98%" TextMode="Number" min="0"> </asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-12 form-group">
                                            <label class="col-2 form-control-label">Ngày bắt đầu :</label>
                                            <div class="col-10">
                                                <input type="date" id="dteNgayBatDau" runat="server" style="width: 98%" class="form-control boxed" />
                                            </div>
                                        </div>
                                        <div class="col-12 form-group">
                                            <label class="col-2 form-control-label">Ngày kết thúc :</label>
                                            <div class="col-10">
                                                <input type="date" id="dteNgayKetThuc" runat="server" style="width: 98%" class="form-control boxed" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
        <FooterContentTemplate>
            <div class="mar_but button">
                <asp:Button ID="btnLuu" runat="server" ClientIDMode="Static" Text="Lưu" CssClass="btn btn-primary" OnClientClick="return checkNULL()" OnClick="btnLuu_Click" />
            </div>
        </FooterContentTemplate>
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
    </dx:ASPxPopupControl>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="hibodybottom" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="hifooter" runat="Server">
    <script type="text/javascript">
        function clickavatar1() {
            $("#up1 input[type=file]").click();
        }
        //function clickavatar2() {
        //    $("#up2 input[type=file]").click();
        //}
        //function clickavatar3() {
        //    $("#up3 input[type=file]").click();
        //}
        //function clickavatar4() {
        //    $("#up4 input[type=file]").click();
        //}
        //function clickavatar5() {
        //    $("#up5 input[type=file]").click();
        //}

    </script>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="hifootersite" runat="Server">
</asp:Content>

