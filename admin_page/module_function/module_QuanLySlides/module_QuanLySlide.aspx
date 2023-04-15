<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="module_QuanLySlide.aspx.cs" Inherits="admin_page_module_function_module_QuanLySlides_module_QuanLySlide" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headlink" runat="Server">
    <style>
        .img_slide {
            width: 300px;
            height: 150px;
            object-fit: fill;
        }

        .table {
            margin-top: 6%;
        }

            .table tr th {
                background-color: #52bcd3;
                color: white;
            }

            .table tr th, td {
                border: 1px solid #eceeef
            }

        input {
            width: 30px;
            height: 30px;
        }

        .btnLuu {
            width: 50px;
            height: 30px;
            color: #ffffff;
            background-color: #31a7c1;
            border-color: #2fa0b9;
        }

        .btn-primary {
            width: 80px;
        }

        .btnChon {
            width: 100px;
            height: 100px;
            background-color: #31a7c1;
            border-color: #2fa0b9;
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="hihead" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="himenu" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="hibodyhead" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="hibodywrapper" runat="Server">
    <script>
        function checkNULL() {
            var CityName = document.getElementById('<%= txtNoiDung.ClientID%>');
            var checkDate = document.getElementById('<%= txtDay.ClientID%>');
            var checkImg = document.getElementById('<%= FileUpload1.ClientID%>');

            if (CityName.value.trim() == "") {
                swal('Tên form không được để trống!', '', 'warning').then(function () { CityName.focus(); });
                return false;
            }
            if (checkDate.value == "") {
                swal('Thời gian không được để trống!', '', 'warning').then(function () { checkDate.focus(); });
                return false;
            }
            if (checkImg.value == "") {
                swal('Hình ảnh không được để trống!', '', 'warning').then(function () { checkImg.focus(); });
                return false;
            }
            return true;
        }
        function showPreview1(input) {
            if (input.files && input.files[0]) {
                var filerdr = new FileReader();
                filerdr.onload = function (e) {
                    $('#imgPreview1').attr('src', e.target.result);
                    $('#imgPreview1').css("width", "250px");
                }
                filerdr.readAsDataURL(input.files[0]);
            }
        }
        function showImg1_1(img) {
            $('#imgPreview1').attr('src', img);
            $('#imgPreview1').css("width", "250px");
        }
        function MyTime() {
            document.getElementById('<%=btnTime.ClientID%>').click();
        }
    </script>
    <div class="card card-block">
        <div style="display: flex" class="col-sm-6">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <a href="javascript:void(0)" runat="server" id="btnThem" onserverclick="btnThem_ServerClick" class="btn btn-primary">Thêm</a>
                    <%--<a href="javascript:void(0)" runat="server" id="btnSua" onserverclick="btnSua_ServerClick" class="btn btn-primary">Sửa</a>--%>
                </ContentTemplate>
            </asp:UpdatePanel>
            <a style="margin-left: 4px;" href="javascript:void(0)" runat="server" id="btnXoa" onserverclick="btnXoa_ServerClick" class="btn btn-primary">Xoá</a>
        </div>
        <div class="col-sm-6">
            <label>Thời gian:</label>
            <input type="date" style="width: 120px;" runat="server" id="txtDate" onchange="MyTime()"/>
            <a href="javascript:void(0)" runat="server" id="btnTime" hidden="hidden" onserverclick="btnTime_ServerClick" ></a>
        </div>
        <%--Danh sách Slide--%>
        <dx:ASPxGridView ID="rpBangSlide" runat="server" ClientInstanceName="rpBangSlide" KeyFieldName="slide_id" Width="100%">
            <Columns>
                <dx:GridViewCommandColumn ShowSelectCheckbox="True" SelectAllCheckboxMode="Page" VisibleIndex="0" Width="2%">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataColumn Caption="Ngày tạo" FieldName="slide_create" HeaderStyle-HorizontalAlign="Center" Width="5%"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Hình ảnh" HeaderStyle-HorizontalAlign="Center" Width="20%">
                    <DataItemTemplate>
                        <img class="img_slide" src="../../../<%#Eval("slide_img")%>" height="100" />
                    </DataItemTemplate>
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Nội dung" FieldName="slide_content" HeaderStyle-HorizontalAlign="Center" Width="30%"></dx:GridViewDataColumn>
                <%--<dx:GridViewDataColumn Caption="Chọn" Width="5%" HeaderStyle-HorizontalAlign="Center" CellStyle-VerticalAlign="Middle">
                    <DataItemTemplate>
                        <a href="javascript:void(0)" class="btnChon" id="<%#Eval("slide_id")%>" onclick="MyChecked(<%#Eval("slide_id")%>,<%#Convert.ToInt32(Eval("slide_hidden"))%>)">chọn</a>
                    </DataItemTemplate>
                </dx:GridViewDataColumn>--%>
            </Columns>
            <SettingsSearchPanel Visible="true" />
            <SettingsBehavior AllowFocusedRow="true" />
            <SettingsText EmptyDataRow="Không có dữ liệu" SearchPanelEditorNullText="Gõ từ cần tìm kiếm và enter..." />
            <SettingsLoadingPanel Text="Đang tải..." />
            <SettingsPager PageSize="10" Summary-Text="Trang {0} / {1} ({2} trang)"></SettingsPager>
        </dx:ASPxGridView>
        <%--Thêm Slide--%>
        <dx:ASPxPopupControl ID="popupControl" runat="server" Width="1000px" Height="650px" CloseAction="CloseButton" ShowCollapseButton="True" ShowMaximizeButton="True" ScrollBars="Auto" CloseOnEscape="true" Modal="True"
            PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="popupControl" ShowFooter="true"
            HeaderText="Thông tin slide" AllowDragging="True" PopupAnimationType="Fade" EnableViewState="False" AutoUpdatePosition="true" ClientSideEvents-CloseUp="function(s,e){grvList.Refresh();}">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <asp:UpdatePanel ID="udPopup" runat="server">
                        <ContentTemplate>
                            <div class="popup-main">
                                <div class="div_content col-12">
                                    <div class="col-12">
                                        <div class="col-12 form-group">
                                            <label class="col-2 form-control-label">Thời gian:</label>
                                            <div class="col-10">
                                                <input id="txtDay" style="width: 110px;" runat="server" type="date" name="name" value="" />
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="text-color1"><i>Kích thước ảnh tiêu chuẩn 1300x600</i></div>
                                            <div class="colum-5 form-group">
                                                <label class="form-control-label">Hình ảnh :</label>
                                                <div id="up1" class="">
                                                    <asp:FileUpload CssClass="hidden-xs-up" ID="FileUpload1" runat="server" onchange="showPreview1(this)" />
                                                    <button type="button" class="btn-chang" onclick="clickavatar1()">
                                                        <img id="imgPreview1" src="/admin_images/Preview-icon.png" style="width: 100%" />
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <input type="text" hidden="hidden" id="txtImage" value="/admin_images/Preview-icon.png" runat="server" />

                                        <div class="col-12">
                                            <div class="col-12 form-group">
                                                <label class="col-12 form-control-label">Nội dung:</label>
                                            </div>
                                            <div class="col-10">
                                                <asp:TextBox ID="txtNoiDung" runat="server" ClientIDMode="Static" CssClass="form-control boxed" Width="90%"> </asp:TextBox>
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
                    <asp:Button ID="btnLuu" runat="server" ClientIDMode="Static" Text="Lưu" CssClass="btnLuu" OnClientClick="return checkNULL()" OnClick="btnLuu_Click" />
                </div>
            </FooterContentTemplate>
            <ContentStyle>
                <Paddings PaddingBottom="0px" />
            </ContentStyle>
        </dx:ASPxPopupControl>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="hibodybottom" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="hifooter" runat="Server">
    <script type="text/javascript">
        function clickavatar1() {
            $("#up1 input[type=file]").click();
        }
    </script>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="hifootersite" runat="Server">
</asp:Content>

