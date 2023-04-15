<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="module_News_Content.aspx.cs" Inherits="admin_page_module_function_module_WebSite_module_News_Content" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v17.1" %>
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headlink" runat="Server">
    <script type="text/javascript">
        function clickavatar1() {
            $("#up1 input[type=file]").click();
        }
    </script>
    <script type="text/javascript">
        function showPreview(input) {
            if (input.files && input.files[0]) {
                var filerdr = new FileReader();
                filerdr.onload = function (e) {
                    $('#hibodywrapper_popupControl_imgPreview').attr('src', e.target.result);
                }
                filerdr.readAsDataURL(input.files[0]);
            }
        }
        function showPreview1(input) {
            if (input.files && input.files[0]) {
                var filerdr = new FileReader();
                filerdr.onload = function (e) {
                    $('#imgPreview1').attr('src', e.target.result);
                }
                filerdr.readAsDataURL(input.files[0]);
            }
        }
        function showImg(img) {
            $('#hibodywrapper_popupControl_imgPreview').attr('src', img);
        }
        function showImg1_1(img) {
            $('#imgPreview1').attr('src', img);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="hihead" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="himenu" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="hibodyhead" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="hibodywrapper" runat="Server">
    <div class="card card-block">
        <div class="form-group row">
            <div class="div_content col-12">
                <div class="col-12">
                    <div class="col-9">
                        <div class="col-12 form-group">
                            <label class="col-2 form-control-label">Loại tin tức:</label>
                            <div class="col-10">
                                <dx:ASPxComboBox ID="ddlloaisanpham" runat="server" ValueType="System.Int32" TextField="newscate_title" ValueField="newscate_id" ClientInstanceName="ddlloaisanpham" CssClass="" Width="95%"></dx:ASPxComboBox>
                            </div>
                        </div>
                        <div class="col-12 form-group">
                            <label class="col-2 form-control-label">Tiêu đề:</label>
                            <div class="col-10">
                                <asp:TextBox ID="txtTieuDe" runat="server" ClientIDMode="Static" CssClass="form-control boxed" Width="90%"> </asp:TextBox>
                            </div>
                        </div>
                        <div class="col-12 form-group">
                            <label class="col-2 form-control-label">Ngày đăng:</label>
                            <div class="col-10">
                                <input id="dteNgayDang" runat="server" type="date" class="form-control boxed" style="width: 90%" />
                            </div>
                        </div>
                        <div class="col-12 form-group">
                            <label class="col-2 form-control-label">Tóm tắt:</label>
                            <div class="col-10">
                                <asp:TextBox ID="txttomtat" runat="server" ClientIDMode="Static" CssClass="form-control boxed" Width="90%"> </asp:TextBox>
                            </div>
                        </div>
                        <%--<div class="col-12 form-group">
                            <label class="col-2 form-control-label">Vị Trí Show:</label>
                            <div class="col-10">
                                <div class="row">
                                    <div class="col-md-3">
                                        <label>
                                            <input class="checkbox" type="checkbox" id="txtTrangChu" runat="server" />
                                            <span></span>
                                            <p class="pr-name">Trang Chủ</p>
                                        </label>
                                    </div>
                                    <div class="col-md-3">
                                        <label>
                                            <input class="checkbox" type="checkbox" id="txtTrungHocPT" runat="server" />
                                            <span></span>
                                            <p class="pr-name">Trung Học Phổ Thông</p>
                                        </label>
                                    </div>
                                    <div class="col-md-3">
                                        <label>
                                            <input class="checkbox" type="checkbox" id="txtTrungHocCS" runat="server" />
                                            <span></span>
                                            <p class="pr-name">Trung Học Cơ Sở</p>
                                        </label>
                                    </div>
                                    <div class="col-md-3">
                                        <label>
                                            <input class="checkbox" type="checkbox" id="txtTieuHoc" runat="server" />
                                            <span></span>
                                            <p class="pr-name">Tiểu Học</p>
                                        </label>
                                    </div>
                                    <div class="col-md-3">
                                        <label>
                                            <input class="checkbox" type="checkbox" id="txtMamNon" runat="server" />
                                            <span></span>
                                            <p class="pr-name">Mầm Non</p>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
                    </div>
                    <div class="col-3">
                        <input type="text" runat="server" id="txtImage" value="" hidden="hidden" />
                        <div class="col-12 form-group">
                            <div class="text-color1"><i>Kích thước ảnh tiêu chuẩn 790x525</i></div>
                            <div class="colum-5 form-group">
                                <label class="form-control-label">Hình ảnh :</label>
                                <div id="up1" class="">
                                    <asp:FileUpload CssClass="hidden-up" ID="FileUpload1" runat="server" onchange="showPreview1(this)" />
                                    <button type="button" class="btn-chang" onclick="clickavatar1()">
                                        <img id="imgPreview1" src="/admin_images/up-img.png" style="max-width: 100%; height: 200px" />
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="col-12 form-group">
                            <label class="col-12 form-control-label">Nội dung:</label>
                        </div>
                        <div class="col-12 form-group">
                            <div class="col-12">
                                <dx:ASPxHtmlEditor ID="edtnoidung" ClientInstanceName="edtnoidung" runat="server" Width="100%" Height="750px" Border-BorderStyle="Solid" Border-BorderWidth="1px" Border-BorderColor="#dddddd">
                                    <SettingsHtmlEditing EnablePasteOptions="true" AllowYouTubeVideoIFrames="true" />
                                    <Settings AllowHtmlView="true" AllowContextMenu="Default" />
                                    <settingsimageupload uploadfolder="~/editorimages"></settingsimageupload>
                                    <Toolbars>
                                        <dx:HtmlEditorToolbar>
                                            <Items>
                                                <dx:ToolbarCustomCssEdit Width="120px">
                                                    <Items>
                                                        <dx:ToolbarCustomCssListEditItem TagName="" Text="Clear Style" CssClass="" />
                                                        <dx:ToolbarCustomCssListEditItem TagName="H1" Text="Title" CssClass="CommonTitle">
                                                            <PreviewStyle CssClass="CommonTitlePreview" />
                                                        </dx:ToolbarCustomCssListEditItem>
                                                        <dx:ToolbarCustomCssListEditItem TagName="H3" Text="Header1" CssClass="CommonHeader1">
                                                            <PreviewStyle CssClass="CommonHeader1Preview" />
                                                        </dx:ToolbarCustomCssListEditItem>
                                                        <dx:ToolbarCustomCssListEditItem TagName="H4" Text="Header2" CssClass="CommonHeader2">
                                                            <PreviewStyle CssClass="CommonHeader2Preview" />
                                                        </dx:ToolbarCustomCssListEditItem>
                                                        <dx:ToolbarCustomCssListEditItem TagName="Div" Text="Content" CssClass="CommonContent">
                                                            <PreviewStyle CssClass="CommonContentPreview" />
                                                        </dx:ToolbarCustomCssListEditItem>
                                                        <dx:ToolbarCustomCssListEditItem TagName="Strong" Text="Features" CssClass="CommonFeatures">
                                                            <PreviewStyle CssClass="CommonFeaturesPreview" />
                                                        </dx:ToolbarCustomCssListEditItem>
                                                        <dx:ToolbarCustomCssListEditItem TagName="Div" Text="Footer" CssClass="CommonFooter">
                                                            <PreviewStyle CssClass="CommonFooterPreview" />
                                                        </dx:ToolbarCustomCssListEditItem>
                                                        <dx:ToolbarCustomCssListEditItem TagName="" Text="Link" CssClass="Link">
                                                            <PreviewStyle CssClass="LinkPreview" />
                                                        </dx:ToolbarCustomCssListEditItem>
                                                        <dx:ToolbarCustomCssListEditItem TagName="EM" Text="ImageTitle" CssClass="ImageTitle">
                                                            <PreviewStyle CssClass="ImageTitlePreview" />
                                                        </dx:ToolbarCustomCssListEditItem>
                                                        <dx:ToolbarCustomCssListEditItem TagName="" Text="ImageMargin" CssClass="ImageMargin">
                                                            <PreviewStyle CssClass="ImageMarginPreview" />
                                                        </dx:ToolbarCustomCssListEditItem>
                                                    </Items>
                                                </dx:ToolbarCustomCssEdit>
                                                <dx:ToolbarParagraphFormattingEdit>
                                                    <Items>
                                                        <dx:ToolbarListEditItem Text="Normal" Value="p" />
                                                        <dx:ToolbarListEditItem Text="Heading  1" Value="h1" />
                                                        <dx:ToolbarListEditItem Text="Heading  2" Value="h2" />
                                                        <dx:ToolbarListEditItem Text="Heading  3" Value="h3" />
                                                        <dx:ToolbarListEditItem Text="Heading  4" Value="h4" />
                                                        <dx:ToolbarListEditItem Text="Heading  5" Value="h5" />
                                                        <dx:ToolbarListEditItem Text="Heading  6" Value="h6" />
                                                        <dx:ToolbarListEditItem Text="Address" Value="address" />
                                                        <dx:ToolbarListEditItem Text="Normal (DIV)" Value="div" />
                                                    </Items>
                                                </dx:ToolbarParagraphFormattingEdit>
                                                <dx:ToolbarFontNameEdit>
                                                    <Items>
                                                        <dx:ToolbarListEditItem Value="Times New Roman" Text="Times New Roman"></dx:ToolbarListEditItem>
                                                        <dx:ToolbarListEditItem Value="Tahoma" Text="Tahoma"></dx:ToolbarListEditItem>
                                                        <dx:ToolbarListEditItem Value="Verdana" Text="Verdana"></dx:ToolbarListEditItem>
                                                        <dx:ToolbarListEditItem Value="Arial" Text="Arial"></dx:ToolbarListEditItem>
                                                        <dx:ToolbarListEditItem Value="MS Sans Serif" Text="MS Sans Serif"></dx:ToolbarListEditItem>
                                                        <dx:ToolbarListEditItem Value="Courier" Text="Courier"></dx:ToolbarListEditItem>
                                                        <dx:ToolbarListEditItem Value="bodoni MT" Text="bodoni MT"></dx:ToolbarListEditItem>
                                                    </Items>
                                                </dx:ToolbarFontNameEdit>
                                                <dx:ToolbarFontSizeEdit>
                                                    <Items>
                                                        <dx:ToolbarListEditItem Value="1" Text="1 (8pt)"></dx:ToolbarListEditItem>
                                                        <dx:ToolbarListEditItem Value="2" Text="2 (10pt)"></dx:ToolbarListEditItem>
                                                        <dx:ToolbarListEditItem Value="3" Text="3 (12pt)"></dx:ToolbarListEditItem>
                                                        <dx:ToolbarListEditItem Value="4" Text="4 (14pt)"></dx:ToolbarListEditItem>
                                                        <dx:ToolbarListEditItem Value="5" Text="5 (18pt)"></dx:ToolbarListEditItem>
                                                        <dx:ToolbarListEditItem Value="6" Text="6 (24pt)"></dx:ToolbarListEditItem>
                                                        <dx:ToolbarListEditItem Value="7" Text="7 (36pt)"></dx:ToolbarListEditItem>
                                                    </Items>
                                                </dx:ToolbarFontSizeEdit>
                                                <dx:ToolbarBoldButton BeginGroup="True" />
                                                <dx:ToolbarItalicButton />
                                                <dx:ToolbarUnderlineButton />
                                                <dx:ToolbarStrikethroughButton />
                                                <dx:ToolbarJustifyLeftButton BeginGroup="True" />
                                                <dx:ToolbarJustifyCenterButton />
                                                <dx:ToolbarJustifyRightButton />
                                                <dx:ToolbarJustifyFullButton />
                                                <dx:ToolbarBackColorButton BeginGroup="True" />
                                                <dx:ToolbarFontColorButton />
                                            </Items>
                                        </dx:HtmlEditorToolbar>
                                    </Toolbars>
                                </dx:ASPxHtmlEditor>
                            </div>
                        </div>
                        <asp:Button ID="btnLuu" runat="server" CssClass="btn btn-primary" Text="Lưu" OnClick="btnLuu_Click" />
                        <table>
                            <tr>
                                <th style="width: 0.1%">SEO&nbsp;Keywords
                                </th>
                                <th style="width: 0.1%">&nbsp;:&nbsp;
                                </th>
                                <th>
                                    <dx:ASPxTextBox ID="SEO_KEYWORD" runat="server" ClientInstanceName="SEO_KEYWORD" CssClass="InputText"
                                        Width="100%">
                                    </dx:ASPxTextBox>
                                </th>
                            </tr>
                            <tr>
                                <th style="width: 0.1%">SEO&nbsp;tiêu&nbsp;đề
                                </th>
                                <th style="width: 0.1%">&nbsp;:&nbsp;
                                </th>
                                <th>
                                    <dx:ASPxTextBox ID="SEO_TITLE" runat="server" ClientInstanceName="SEO_TITLE" CssClass="InputText"
                                        Width="100%">
                                    </dx:ASPxTextBox>
                                </th>
                            </tr>
                            <tr>
                                <th style="width: 0.1%">SEO&nbsp;link
                                </th>
                                <th style="width: 0.1%">&nbsp;:&nbsp;
                                </th>
                                <th>
                                    <dx:ASPxTextBox ID="SEO_LINK" runat="server" ClientInstanceName="SEO_LINK" CssClass="InputText"
                                        Width="100%">
                                    </dx:ASPxTextBox>
                                </th>
                            </tr>
                            <tr>
                                <th style="width: 0.1%">SEO&nbsp;nội&nbsp;dung
                                </th>
                                <th style="width: 0.1%">&nbsp;:&nbsp;
                                </th>
                                <th>
                                    <input name="SEO_DEP" type="text" id="SEO_DEP" runat="server" class="InputText" style="width: 99.5%; height: 30px" onkeydown="CountLeft(hibodywrapper_popupControl_SEO_DEP, this.form.left,160);" onkeyup="CountLeft(hibodywrapper_popupControl_SEO_DEP,this.form.left,160);" />
                                    <input type="text" name="left" size="3" maxlength="3" value="160" disabled="disabled" />
                                </th>
                            </tr>
                            <tr>
                                <th style="width: 0.1%">SEO&nbsp;Image
                                </th>
                                <th style="width: 0.1%">&nbsp;:&nbsp;
                                </th>
                                <th>
                                    <dx:ASPxTextBox ID="SEO_IMAGE" runat="server" ClientInstanceName="SEO_IMAGE" CssClass="InputText"
                                        Width="100%">
                                    </dx:ASPxTextBox>
                                </th>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="hibodybottom" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="hifooter" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="hifootersite" runat="Server">
</asp:Content>

