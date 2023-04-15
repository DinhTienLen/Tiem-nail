<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="true" CodeFile="module_ThongTinHoaDon.aspx.cs" Inherits="admin_page_module_function_module_HoaDonThanhToan_module_ThongTinHoaDon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headlink" runat="Server">
    <link href="css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="hihead" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="himenu" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="hibodyhead" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="hibodywrapper" runat="Server">
    <style>
        .card {
            display: flex;
            flex-direction: row;
        }
    </style>
    <div class="card card-block row">
        <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-xs-12">
            <div>
                <a id="btnDichVu" class="btn btn-primary">Dịch vụ</a>
                <a id="btnNailBox" class="btn btn-primary">Nails box</a>
                <a id="btnDongGia" class="btn btn-primary">Đồng giá 69k</a>
                <%--           <a id="btnXuHuong"class="btn btn-primary" onserverclick="btnXuHuong_ServerClick">Xu hướng</a>--%>
            </div>
            <%--<div id="btnNhomDichVu" runat="server">
                <a id="btnCoBan" class="btn btn-danger">Cơ bản</a>
                <a id="btnSonGel" class="btn btn-danger">Sơn gel</a>
                <a id="btnNoiMong" class="btn btn-danger">Nối móng</a>
                <a id="btnDesignVe" class="btn btn-danger">Design - vẽ</a>
                <a id="btnGoi" class="btn btn-danger">Gội</a>
                <a id="btnTrietLong" class="btn btn-danger">Triệt lông</a>
            </div>--%>
        </div>
        <div class="form-group table-responsive">
            <div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-xs-12">
                <h1>Thanh toán hoá đơn</h1>
                Lưu ý: Tạo bill xong mới cấp nhật số lượng, đơn giá sản phẩm
                    <br />
                Ngày
                    <input type="date" id="dteNgay" />
                Giờ vào
                    <input id="txtGiovao" />
                Số lượng khách
                    <input id="txtSoLuongKhachHang" />
                Tên khách hàng
                    <input id="txtTenKhach" />
                Số điện thoại
                    <input id="txtSoDienThoai" />
                <table id="grvChitiet" class="table table-bordered table-hover  ">
                    <thead>
                        <tr style="background: #a3a7a199">
                            <th>STT</th>
                            <th scope="col">Tên sản phẩm</th>
                            <th scope="col">Số lượng</th>
                            <th scope="col">Đơn giá</th>
                            <th scope="col">Thành tiền</th>
                            <th scope="col">Xóa</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td style="width: 150px;">
                                <span></span>
                            </td>

                            <td>
                                <input class="form-control" style="width: 100%;" type="number" />
                            </td>

                            <td>
                                <input class="form-control" style="width: 100%;" type="text" />

                            </td>

                            <td>
                                <span class="thanhtien"></span>
                            </td>

                            <td>
                                <a>Xóa</a>
                            </td>
                        </tr>

                    </tbody>
                </table>
                <div style="display: none">
                    id dv
                            <input type="text" id="txtDichVu_ID" />
                    id dv
                            <input type="text" id="txtDichVu_SoLuong" />
                    id dv
                            <input type="text" id="txtDichVu_ThanhTien" />
                    <a href="#" id="btnUpdateDicVu">content</a>
                </div>
                <br />
                <span>Tổng cộng tiền hàng :  </span>
                <input type="text" id="txtTienHang" />
                <br />
                Mã giảm giá:
            <br />
                <span>% giảm giá :  </span>
                <asp:Label ID="lblPhantram" runat="server"></asp:Label>
                <br />
                <span>Tổng tiền áp dụng Mã giảm giá :  </span>
                <a href="#" id="btnLuu">Lưu</a>
                <%--                <span>Dùng mã giảm giá : </span>
                <span>Tổng cộng tiền thanh toán : </span>--%>
            </div>
        </div>
    </div>
    <input type="text" id="txtTien" name="name" value="" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="hibodybottom" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="hifooter" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="hifootersite" runat="Server">
</asp:Content>

