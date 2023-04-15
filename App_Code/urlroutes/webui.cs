using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for webui
/// </summary>
public class webui
{
    public webui()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public List<string> UrlRoutes()
    {
        List<string> list = new List<string>();
        
        //salabeauty
        list.Add("salabeauty|trang-chu|~/App_Default.aspx");
        list.Add("applogin|app-login|~/web_module/module_app/web_Login.aspx");
        //Xu hướng
        list.Add("capnhatxuhuong|app-cap-nhat-xu-huong|~/web_module/module_app/web_CapNhatXuHuong.aspx");
        list.Add("webcapnhatxuhuongchitiet|cap-nhat-xu-huong-chi-tiet-{xuhuong-id}|~/web_module/module_app/web_CapNhatXuHuongChiTiet.aspx");

        list.Add("menudicvudatlich|menu-dich-vu-dat-lich|~/web_module/module_app/web_ChonMenuDichVu.aspx");
        list.Add("menudicvu|menu-dich-vu|~/web_module/module_app/web_MenuDichVu.aspx");
        list.Add("danhgia|danh-gia|~/web_module/module_app/web_DanhGia.aspx");
        list.Add("homthu|hom-thu|~/web_module/module_app/web_DanhGiaChiTiet.aspx");
        list.Add("sanphamdanhgia|danh-gia-san-pham|~/web_module/module_app/web_SanPhamDanhGia.aspx");

        list.Add("hoadondatlich|hoa-don-dat-lich|~/web_module/module_app/web_DatLich.aspx");
        list.Add("chonsanpham|chon-san-pham|~/web_module/module_app/web_ChonSanPhamDichVu.aspx");
        list.Add("maunail|album-nails|~/web_module/module_app/web_MauNail.aspx");
        list.Add("tintucmagiamgia|thong-tin-ma-giam-gia|~/web_module/module_app/web_MaGiamGiaChiTiet.aspx");
        //Dichvu
        list.Add("tintucdichvu|tin-tuc-dich-vu|~/web_module/module_app/web_DichVu.aspx");
        list.Add("thongtindichvu|thong-tin-dich-vu-{id}|~/web_module/module_app/web_ThongTinDichVuChiTiet.aspx");
        //Nailbox
        list.Add("maunailbox|nails-box|~/web_module/module_app/web_MauNailBox.aspx");
        list.Add("maunailboxchitiet|mau-nails-box-{id}|~/web_module/module_app/web_MauNailBoxChiTiet.aspx");
        list.Add("thongtingiaohang|thong-tin-giao-hang|~/web_module/module_app/web_ThongTinGiaoHang.aspx");
        list.Add("thongtinbill|thong-tin-bill-{id}|~/web_module/module_app/web_ThongTinBill.aspx");
        list.Add("maunailchitietdatlich|mau-nail-dat-lich-{id}|~/web_module/module_app/web_MauNailChiTietDatLich.aspx");
        list.Add("donggia|san-pham-dong-gia|~/web_module/module_app/web_DongGia.aspx");
        list.Add("giohang|gio-hang|~/web_module/module_app/web_GioHang.aspx");
        list.Add("gioithieubanbe|gioi-thieu-ban-be|~/web_module/module_app/web_GioiThieuBanBe.aspx");
        list.Add("gioithieu|gioi-thieu|~/web_module/module_app/web_GioiThieu.aspx");
        list.Add("magiamgia|ma-giam-gia|~/web_module/module_app/web_MaGiamGia.aspx");
        list.Add("maqr|ma-qr|~/web_module/module_app/web_MaQR.aspx");
        list.Add("thietlaptaikhoan|thiet-lap-tai-khoan|~/web_module/module_app/web_ThietLapTaiKhoan.aspx");
        list.Add("thongtinchinhanhchitiet|thong-tin-chi-nhanh-chi-tiet-{chinhanh-id}|~/web_module/module_app/web_ThongTinChiNhanhChiTiet.aspx");
        list.Add("thongtinchinhanh|thong-tin-chi-nhanh|~/web_module/module_app/web_ThongTinChiNhanh.aspx");
        list.Add("thongtinkhachhang|thong-tin-khach-hang|~/web_module/module_app/web_thongtinkhachhang.aspx");
        list.Add("thongtindonhang|thong-tin-don-hang|~/web_module/module_app/web_ThongTinDonHang.aspx");
        list.Add("dangki|dang-ki|~/web_module/module_app/web_DangKi.aspx");
        list.Add("khomagiamgiagiohang|kho-ma-giam-gia-gio-hang|~/web_module/module_app/web_KhoVocherGioHang.aspx");
        list.Add("khomagiamgiadatlich|kho-ma-giam-gia-dat-lich|~/web_module/module_app/web_KhoVocherDatLich.aspx");
        list.Add("chuyenkhoan|chuyen-khoan|~/web_module/module_app/web_ChuyenKhoan.aspx");
        list.Add("yeuthich|san-pham-yeu-thich|~/web_module/module_app/web_SanPhamYeuThich.aspx");
        return list;

    }
}