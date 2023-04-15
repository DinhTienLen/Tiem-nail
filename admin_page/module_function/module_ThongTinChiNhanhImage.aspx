<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="module_ThongTinChiNhanhImage.aspx.cs" Inherits="admin_page_module_function_module_ThongTinChiNhanhImage" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v17.1" %>
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headlink" runat="Server">
    <script src="../../../js/jquery-3.5.1.min.js"></script>
    <style>
        .block-themanh {
            height: 20rem;
            overflow: auto;
            position: relative;
        }

            .block-themanh ul {
                padding-left: 0;
                width: 100% !important;
            }

        img.image_thongtinchinhanh {
            padding: 1px;
            height: 126px;
            width: 126px;
            object-fit: cover;
        }

        .btn_upload {
            display: none;
        }
    </style>
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
    <script>
        function getCookie(cname) {
            var name = cname + "=";
            var decodedCookie = decodeURIComponent(document.cookie);
            var ca = decodedCookie.split(';');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') {
                    c = c.substring(1);
                }
                if (c.indexOf(name) == 0) {
                    return c.substring(name.length, c.length);
                }
            }
            return "";
        }

        function xoaImage(id) {
            var user = getCookie("language");
            if (user == "1") {
                document.getElementById("<%=txtImage.ClientID%>").value = id;
                swal("Bạn có thực sự muốn xóa hình ảnh này?", "", "warning",
                    {
                        buttons: ["Hủy", "Đồng ý"],
                        dangerMode: true
                    }).then(function (value) {
                        if (value == true) {
                            var xoa = document.getElementById('<%=btnXoaImage.ClientID%>');
                            xoa.click();
                        }
                    });
            }
            else {
                document.getElementById("<%=txtImage.ClientID%>").value = id;
                swal("Bạn có thực sự muốn xóa hình ảnh này?", "", "warning",
                    {
                        buttons: ["Hủy", "Đồng ý"],
                        dangerMode: true
                    }).then(function (value) {
                        if (value == true) {
                            var xoa = document.getElementById('<%=btnXoaImage.ClientID%>');
                            xoa.click();
                        }
                    });
            }
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
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script type="text/javascript">

        //func hiện thông báo hoàn thành tạo bài viết
        function func_HoanThanh() {
            Swal.fire({
                position: 'center',
                icon: 'success',
                title: 'Hoàn thành!',
                showConfirmButton: false,
                timer: 1500
            }).then(function () {
                window.location.href = "/admin-thong-tin-chi-nhanh";
            })
        }
    </script>

    <div class="card card-block">
        <div>
            <div id="btnUploadAllImage" runat="server">
                <div>
                    <span>
                        <asp:FileUpload ID="files_upload" name="files[]" ClientIDMode="Static" runat="server" AllowMultiple="true" />
                    </span>
                    <div class="block-themanh col-12">
                        <ul>
                            <asp:Repeater ID="rpImageListing" runat="server">
                                <ItemTemplate>
                                    <li class="col-2" style="list-style: none;">
                                        <div>
                                            <a onclick="xoaImage(<%#Eval("thongtinchinhanhimage_id") %>)" href="javascript:void(0)"><span style="opacity: 1; position: absolute; font-size: 35px; color: red; float: right; font-weight: bold; line-height: 1; text-shadow: 0 1px 0 #fff;">&times;</span></a>
                                            <a>
                                                <img class="image_thongtinchinhanh" src="<%#Eval("thongtinchinhanhimage_image") %>" />
                                            </a>
                                        </div>
                                        <div id="divSub" runat="server"></div>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div>
                <output id="Filelist"></output>
                <div>
                    <asp:Button ID="btnUpload" runat="server" CssClass="btn_upload" OnClick="btnUpload_Click" />
                </div>
                <div id="btn_HoanThanh" runat="server">
                    <a href="javascript:void(0)" id="btnHoanThanh" onclick="func_HoanThanh()" class="btn btn-primary">Hoàn thành </a>
                </div>
            </div>
            <div>
                <input hidden="hidden" id="txtImage" runat="server" />
                <a href="javascript:void(0)" id="btnXoaImage" runat="server" onserverclick="btnXoaImage_ServerClick"></a>
            </div>
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
    </script>
    <script>
        document.addEventListener("DOMContentLoaded", init, false);
        function init() {
            //thêm trình xử lý javascript cho sự kiện tải lên tệp
            document.querySelector("#files_upload").addEventListener('change', function () {
                document.getElementById("<%=btnUpload.ClientID%>").click();
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="hifootersite" runat="Server">
</asp:Content>

