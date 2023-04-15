<%@ Page Title="Quản lý đánh giá sản phẩm" Language="C#" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="module_DanhGiaSanPham.aspx.cs" Inherits="admin_page_module_function_module_DanhGiaSanPham" %>

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
       <%-- function btnChiTiet() {
            document.getElementById('<%=btnChiTiet.ClientID%>').click();
        }--%>
        function popupHide() {
            document.getElementById('btnClosePopup').click();
        }
        <%--function checkNULL() {
            var CityName = document.getElementById('<%= dteNgayBatDau.ClientID%>');
            var CityName2 = document.getElementById('<%= dteNgayKetThuc.ClientID%>');
            var CityName3 = document.getElementById('<%= txtsoluong.ClientID%>');

            if (CityName.value.trim() == "" || CityName2.value.trim() == "" || CityName2.value.trim() == "") {
                swal('Nhập đầy đủ thông tin !', '', 'warning').then(function () { CityName.focus(); });
                return false;
            }
            return true;
        }--%>
      <%--function confirmDel() {
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
        }--%>
        function confirmDel() {
            swal("Bạn có thực sự muốn hiển thị đánh giá này ?",
                "",
                "warning",
                {
                    buttons: true,
                    dangerMode: true
                }).then(function (value) {
                    if (value == true) {
                        var hienthi = document.getElementById('<%=btnHienThi.ClientID%>');
                        hienthi.click();
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
                        <asp:Button ID="btnHienThi" runat="server" CssClass="btn btn-primary" Text="Hiển Thị/Ẩn" OnClick="btnHienThi_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="form-group table-responsive">
            <dx:ASPxGridView ID="grvList" runat="server" ClientInstanceName="grvList" KeyFieldName="danhgiachitiet_id" Width="100%">
                <Columns>
                    <dx:GridViewCommandColumn ShowSelectCheckbox="True" SelectAllCheckboxMode="Page" VisibleIndex="0" Width="2%">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataColumn Caption="Tên khách hàng" FieldName="khachhang_name" HeaderStyle-HorizontalAlign="Center" Width="20%"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Ngày đánh giá" FieldName="danhgiachitiet_ngaylap" HeaderStyle-HorizontalAlign="Center" Width="20%"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Nội dung" FieldName="danhgiachitiet_noidung" HeaderStyle-HorizontalAlign="Center" Width="20%"></dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Hình ảnh" FieldName="danhgiachitiet_image" HeaderStyle-HorizontalAlign="Center" Width="20%">
                         <DataItemTemplate>
                            <img src="<%#Eval("danhgiachitiet_image") %>" height="100" />
                        </DataItemTemplate>
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="Tình trạng" FieldName="tinhtrang" HeaderStyle-HorizontalAlign="Center" Width="20%"></dx:GridViewDataColumn>
                </Columns>
                <%--<ClientSideEvents RowDblClick="btnChiTiet" />--%>
                <SettingsSearchPanel Visible="true" />
                <SettingsBehavior AllowFocusedRow="true" />
                <SettingsText EmptyDataRow="Không có dữ liệu" SearchPanelEditorNullText="Gõ từ cần tìm kiếm và enter..." />
                <SettingsLoadingPanel Text="Đang tải..." />
                <SettingsPager PageSize="10" Summary-Text="Trang {0} / {1} ({2} trang)"></SettingsPager>
            </dx:ASPxGridView>
        </div>
    </div>
    
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

