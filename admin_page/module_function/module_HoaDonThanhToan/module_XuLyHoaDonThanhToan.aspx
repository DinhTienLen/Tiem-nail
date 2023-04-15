<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="module_XuLyHoaDonThanhToan.aspx.cs" Inherits="admin_page_module_function_module_HoaDonThanhToan_module_XuLyHoaDonThanhToan" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v17.1" %>

<asp:Content ID="Content5" ContentPlaceHolderID="hibodywrapper" runat="Server">
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .card {
            display: flex;
            flex-direction: row;
        }

        .block-thongtin {
            display: flex;
            flex-direction: column;
            line-height: 29px;
        }

            .block-thongtin input {
                margin: 3% 0px;
            }

        #grvChitiet {
            font-size: 12px;
        }

            #grvChitiet th {
                text-align: center;
                padding: 4px;
            }

            #grvChitiet td {
                /*width: 10rem;*/
                text-align: center;
                padding: 1%;
            }

        .form-control {
            width: 100%;
            border: none;
            font-size: 13px;
            padding: unset;
        }

        h1 {
            color: #e91e63;
            font-size: 31px;
            font-weight: 600;
            text-align: center;
        }

        .dxgvSearchPanel_Moderno > table {
            width: 126%;
        }

        .block-thongtin input {
            /* border: none; */
            box-shadow: 2px 3px 9px 2px #e2b7c557;
            border: 1px solid #f6799d;
            margin: 3% 0px;
        }

        #grvChitiet th {
            font-size: 11px;
            padding: 1%;
            color: #795548;
            background: antiquewhite;
            padding: 4px;
        }

        .table thead th {
            border-bottom: 2px solid #ffffff;
        }

        bordered th {
            border: 1px solid #ffffff;
        }

        .block-thanhtoan {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 2% 0;
        }

        .block-thongtin span {
            font-weight: 600;
        }

        span {
            color: black;
        }

        .block-btn {
            margin-top: 10px;
        }

            .block-btn a {
                color: #795548;
                background: #faebd7;
                padding: 5px;
                text-decoration: none;
                font-weight: 600;
                margin-right: 4%;
            }
    </style>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="card card-block row" style="padding: 2% 0">
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div>
                        <a id="btnDichVu" class="btn btn-primary" runat="server" onserverclick="btnDichVu_ServerClick">Dịch vụ</a>
                        <%-- <a id="btnAlbumMauNails"class="btn btn-primary" onserverclick="btnAlbumMauNails_ServerClick">Album mẫu nails</a>--%>
                        <a id="btnNailBox" class="btn btn-primary" runat="server" onserverclick="btnNailBox_ServerClick">Nails box</a>
                        <a id="btnDongGia" class="btn btn-primary" runat="server" onserverclick="btnDongGia_ServerClick">Đồng giá 69k</a>
                        <a id="btnMenuSanPham" class="btn btn-primary" runat="server" onserverclick="btnMenuSanPham_ServerClick">Menu sản phẩm</a>
                    </div>
                    <div id="btnNhomDichVu" runat="server">
                        <a id="btnCoBan" class="btn btn-danger" runat="server" onserverclick="btnCoBan_ServerClick">Cơ bản</a>
                        <a id="btnSonGel" class="btn btn-danger" runat="server" onserverclick="btnSonGel_ServerClick">Sơn gel</a>
                        <a id="btnNoiMong" class="btn btn-danger" runat="server" onserverclick="btnNoiMong_ServerClick">Nối móng</a>
                        <a id="btnDesignVe" class="btn btn-danger" runat="server" onserverclick="btnDesignVe_ServerClick">Design - vẽ</a>
                        <a id="btnGoi" class="btn btn-danger" runat="server" onserverclick="btnGoi_ServerClick">Gội</a>
                        <a id="btnTrietLong" class="btn btn-danger" runat="server" onserverclick="btnTrietLong_ServerClick">Triệt lông</a>
                    </div>
                    <div id="div_AlbumSanPham" runat="server">
                        <asp:Repeater runat="server" ID="rpAlbumSanPham">
                            <ItemTemplate>
                                <a href="#" class="btn btn-danger" id="album_<%#Eval("loaisanpham_id") %>" onclick="myAlbumSanPham(<%#Eval("loaisanpham_id") %>)"><%#Eval("loaisanpham_name") %></a>
                            </ItemTemplate>
                        </asp:Repeater>
                        <div style="display: none">
                            <input type="text" id="txtAlbumSanPham_Id" runat="server" />
                            <a href="#" id="btnAlbumSanPham" runat="server" onserverclick="btnAlbumSanPham_ServerClick">content</a>
                        </div>
                    </div>
                    <div class="form-group table-responsive">
                        <dx:ASPxGridView ID="grvListDV" runat="server" ClientInstanceName="grvListDV" KeyFieldName="sanpham_id" Width="25%">
                            <Columns>
                                <dx:GridViewDataColumn Caption="Tên sản phẩm" FieldName="sanpham_name" HeaderStyle-HorizontalAlign="Center" Width="15%"></dx:GridViewDataColumn>
                                <dx:GridViewDataColumn Caption="Giá tiền" FieldName="sanpham_giatien" HeaderStyle-HorizontalAlign="Center" Width="5%">
                                    <DataItemTemplate>
                                        <%#Eval("sanpham_giatien", "{0:N0}") %>
                                    </DataItemTemplate>

                                </dx:GridViewDataColumn>
                                <dx:GridViewDataColumn Caption="Chọn" FieldName="sanpham_giatien" HeaderStyle-HorizontalAlign="Center" Width="5%">
                                    <DataItemTemplate>
                                        <input id="cbDV_<%#Eval("sanpham_id")%>" type="checkbox" name="cbSP" value="<%#Eval("sanpham_id")%>" onclick="getIDDV(<%#Eval("sanpham_id")%>)" />
                                    </DataItemTemplate>
                                </dx:GridViewDataColumn>
                            </Columns>
                            <%-- <ClientSideEvents RowDblClick="btnChiTiet" />--%>
                            <SettingsSearchPanel Visible="true" />
                            <SettingsBehavior AllowFocusedRow="true" />
                            <SettingsText EmptyDataRow="Không có dữ liệu" SearchPanelEditorNullText="Gõ từ cần tìm kiếm và enter..." />
                            <SettingsLoadingPanel Text="Đang tải..." />
                            <SettingsPager PageSize="30" Summary-Text="Trang {0} / {1} ({2} trang)"></SettingsPager>
                        </dx:ASPxGridView>
                    </div>
                    <div style="display: none">
                        <input type="text" id="txtIDDV" runat="server" />
                        <a href="javascript:void(0)" id="btnChonDichVu" onserverclick="btnChonDichVu_ServerClick" runat="server">content</a>
                        <a href="javascript:void(0)" id="btnXoaDV" type="button" onserverclick="btnXoaDV_ServerClick" runat="server">Xóa</a>
                    </div>
                </div>

                <div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-xs-12" style="padding: 3%;">
                    <span class="col-12" style="color: #e91e63; font-size: 31px; font-weight: 600; text-align: center;">Thanh toán hoá đơn</span>
                    Lưu ý: Tạo bill xong mới cấp nhật số lượng, đơn giá sản phẩm
                    <div class="block-thongtin">
                        <span>Thời gian tạo bill</span>
                        <div style="display: flex">
                            <input style="margin: 3% 0% 3% 0; border: none; box-shadow: none; width: 41%;" type="date" id="dteNgay" runat="server" readonly />
                            <input style="margin: 3% 0 3% -27px; width: 53%; border: none; box-shadow: none;" id="txtGiovao" runat="server" readonly />
                        </div>
                        <span>Số điện thoại</span>
                        <input id="txtSoDienThoai" runat="server" onchange="myGetTenKhachHang()" />
                        <span>Tên khách hàng</span>
                        <input id="txtTenKhach" runat="server" />
                    </div>
                    <div style="display: none">
                        <span>Số lượng khách</span>
                        <input id="txtSoLuongKhachHang" runat="server" />
                        <a href="#" id="btnGetTenKhachHang" runat="server" onserverclick="btnGetTenKhachHang_ServerClick">content</a>
                        <%-- <span>Tên khách hàng</span>
                        <input id="txtTenKhach" runat="server" />--%>
                    </div>

                    <asp:UpdatePanel ID="upDetail" runat="server">
                        <ContentTemplate>
                            <table id="grvChitiet" class="table table-bordered table-hover  ">
                                <thead>
                                    <tr style="background: #a3a7a199">
                                        <th>STT</th>
                                        <th scope="col">Tên sản phẩm</th>
                                        <th scope="col">SL</th>
                                        <th scope="col">Đơn giá</th>
                                        <th scope="col">Thành tiền</th>
                                        <th scope="col">Xóa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rp_DichVu" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%= stt++ %></td>

                                                <td>
                                                    <span style="width: 200px;"><%#Eval("dichvu_name") %></span>
                                                </td>

                                                <td style="width: 4px;">
                                                    <input class="form-control" style="text-align: center" type="number" onchange="update_SoLuong(<%#Eval("dichvu_id") %>)" id="txtSoLuongDV_<%#Eval("dichvu_id") %>" value="<%#Eval("dichvu_soluong") %>" min="0" />
                                                </td>

                                                <td>
                                                    <input class="form-control" style="width: 70px; text-align: center;" type="text" onchange="update_GiaTien(<%#Eval("dichvu_id") %>)" id="txtGiaTienDV_<%#Eval("dichvu_id") %>" value="<%#Eval("dichvu_giatien", "{0:N0}") %>" />
                                                    <input class="form-control" style="display: none" type="text" onchange="update_GiaTien(<%#Eval("dichvu_id") %>)" id="txtDonGiaDV_<%#Eval("dichvu_id") %>" value="<%#Eval("dichvu_giatien") %>" />
                                                </td>

                                                <td>
                                                    <span id="txtThanhTienDV_<%#Eval("dichvu_id")%>"><%#Eval("dichvu_thanhtien", "{0:N0}") %></span>
                                                    <span class="thanhtien" id="txtTienDV_<%#Eval("dichvu_id")%>" style="display: none"><%#Eval("dichvu_thanhtien") %></span>
                                                </td>

                                                <td>
                                                    <a href="javascript:void(0)" id="btnXoa<%#Eval("dichvu_id") %>" onclick="DeleteDV(<%#Eval("dichvu_id") %>)" style="color: red; text-decoration: none;">Xóa</a>
                                                </td>
                                            </tr>

                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                            <div style="display: none">
                                id dv
                            <input type="text" id="txtDichVu_ID" runat="server" />
                                id dv
                            <input type="text" id="txtDichVu_SoLuong" runat="server" />
                                id dv
                            <input type="text" id="txtDichVu_ThanhTien" runat="server" />
                                DG DV
                                 <input type="text" id="txtDichVu_DonGia" runat="server" />
                                <a href="#" id="btnUpdateDicVu" runat="server" onserverclick="btnUpdateDicVu_ServerClick">content</a>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <br />
                    <div class="block-thanhtoan">
                        <span>Tổng cộng </span>
                        <input type="text" id="txtTienHang" style="text-align: center" runat="server" />
                    </div>
                    <div class="block-thanhtoan">
                        <span>Mã giảm giá:</span>
                        <asp:DropDownList ID="ddlMaGiamGia" Style="width: 57%; border: none; background: antiquewhite; text-align: center;"
                            runat="server" OnSelectedIndexChanged="ddlMaGiamGia_SelectedIndexChanged" AutoPostBack="true">
                        </asp:DropDownList>
                    </div>
                    <span>% giảm giá :  </span>
                    <asp:Label ID="lblPhantram" runat="server"></asp:Label>
                    <br />
                    <div class="block-thanhtoan"></div>
                    <div>
                        <span>Tổng tiền thanh toán :  </span>
                        <asp:Label ID="lblTongTienApDungMa" runat="server"></asp:Label>
                    </div>
                    <input style="display: none" type="text" id="txtTongTienPhaiTra" runat="server" />
                    <div class="block-btn">
                        <a href="#" id="btnLuu" runat="server" onserverclick="btnLuu_ServerClick">Lưu</a>
                        <a href="/admin-hoa-don-thanh-toan">Back</a>
                    </div>
                    <%--                <span>Dùng mã giảm giá : </span>
                <span>Tổng cộng tiền thanh toán : </span>--%>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <%--Script để xử lý bắt ID dịch vụ và ID sản phẩm --%>
    <script>
        var arrIDDV = [];
        function getIDDV(id) {
            //Get the checkbox value
            var IDDV = document.getElementById("cbDV_" + id).value;
            document.getElementById("<%=txtIDDV.ClientID%>").value = IDDV;
            document.getElementById("<%=btnChonDichVu.ClientID%>").click();
            if (arrIDDV.includes(IDDV) == false) {
                arrIDDV.push(IDDV);
            }
            //console.log(arrIDDV)
        }
        function myGetTenKhachHang() {
            document.getElementById("<%=btnGetTenKhachHang.ClientID%>").click();
        }
        function myAlbumSanPham(id) {
            document.getElementById("<%=txtAlbumSanPham_Id.ClientID%>").value = id;
            document.getElementById("<%=btnAlbumSanPham.ClientID%>").click();
        }
        function setChecked() {
            for (var i = 0; i < arrIDDV.length; i++) {
                if (document.getElementById("cbDV_" + arrIDDV[i]) != undefined)
                    document.getElementById("cbDV_" + arrIDDV[i]).checked = true;
            }
        }
    </script>


    <%--Script để xử lý giá tiền dịch vụ và giá tiền sản phẩm--%>
    <script>
        function tinhTongTien() {
            var price = 0;
            //debugger;
            var elts = document.getElementsByClassName('thanhtien');
            for (var i = 0; i < elts.length; ++i) {
                price = price + parseFloat(elts[i].innerHTML)
            }
            var giamgia = document.getElementById("<%=lblPhantram.ClientID%>").innerHTML;
            if (giamgia != "") {
                var tiengiam = parseFloat(giamgia) / 100;
                var thanhtoan = parseFloat(price) * (1 - tiengiam);
                /* price = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(thanhtoan);*/
                document.getElementById("<%=lblTongTienApDungMa.ClientID%>").innerHTML = price;
                document.getElementById("<%=txtTongTienPhaiTra.ClientID%>").innerHTML = thanhtoan;
                //console.log(price)
            }
            document.getElementById("<%=lblTongTienApDungMa.ClientID%>").innerText = price;
            document.getElementById("<%=txtTienHang.ClientID%>").value = price;
        }
        $(document).ready(function () {
            tinhTongTien();
        });
        function update_SoLuong(id) {
            //var donGiaDV = document.getElementById("txtGiaTienDV_" + id).value;
            var donGiaDV = document.getElementById("txtDonGiaDV_" + id).value;
            var soLuongDV = document.getElementById("txtSoLuongDV_" + id).value;
            var priceTTDV = parseFloat(donGiaDV) * parseFloat(soLuongDV)
            //document.getElementById("txtThanhTienDV_" + id).innerHTML = priceTTDV;
            document.getElementById("txtThanhTienDV_" + id).innerHTML = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(priceTTDV);
            document.getElementById("txtTienDV_" + id).innerHTML = priceTTDV;
            document.getElementById("<%= txtDichVu_ID.ClientID%>").value = id;
            document.getElementById("<%= txtDichVu_SoLuong.ClientID%>").value = soLuongDV;
            document.getElementById("<%= txtDichVu_DonGia.ClientID%>").value = donGiaDV;
            document.getElementById("<%= txtDichVu_ThanhTien.ClientID%>").value = priceTTDV;
            document.getElementById("<%= btnUpdateDicVu.ClientID%>").click();
            //debugger;
            tinhTongTien();
        }
        function update_GiaTien(id) {
            var donGiaDV = document.getElementById("txtGiaTienDV_" + id).value;
            var soLuongDV = document.getElementById("txtSoLuongDV_" + id).value;
            var priceTTDV = parseFloat(donGiaDV) * parseFloat(soLuongDV)
            document.getElementById("txtThanhTienDV_" + id).innerHTML = priceTTDV;
            document.getElementById("txtTienDV_" + id).innerHTML = priceTTDV;
            document.getElementById("<%= txtDichVu_ID.ClientID%>").value = id;
            document.getElementById("<%= txtDichVu_SoLuong.ClientID%>").value = soLuongDV;
            document.getElementById("<%= txtDichVu_DonGia.ClientID%>").value = donGiaDV;
            document.getElementById("<%= txtDichVu_ThanhTien.ClientID%>").value = priceTTDV;
            document.getElementById("<%= btnUpdateDicVu.ClientID%>").click();
            tinhTongTien();
        }
        function DeleteDV(id) {
            swal("Bạn có thực sự muốn xóa sản phẩm này?",
                "",
                {
                    buttons: true,
                    dangerMode: true
                }).then(function (value) {
                    if (value == true) {
                        arrIDDV = arrIDDV.filter(item => item != id);
                        document.getElementById("<%= txtIDDV.ClientID%>").value = id;
                        document.getElementById("<%= btnXoaDV.ClientID%>").click();
                        console.log(arrIDDV);
                    }
                });
        }
    </script>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</asp:Content>

