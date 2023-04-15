using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for adminmodule
/// </summary>
public class adminmodule
{
	public adminmodule()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    
    public List<string> UrlRoutes()
    {
        List<string> list = new List<string>();
        //Module SEO
        list.Add("moduleseo|admin-seo|~/admin_page/module_function/module_SEO.aspx");
        //Module Language
        list.Add("modulelanguage|admin-ngon-ngu|~/admin_page/module_function/admin_LanguagePage.aspx");
        //list.Add("moduleaccount|admin-accounths|~/admin_page/module_function/module_Account.aspx");
      
        //Thanh toán
        //Quản lý nhóm
        list.Add("modulenhomdichvu|admin-nhom-dich-vu|~/admin_page/module_function/module_LoaiDichVu.aspx");
        list.Add("modulenhommaunails|admin-nhom-mau-nails|~/admin_page/module_function/module_LoaiSanPham.aspx");
        //Quản lý sản phẩm
        list.Add("modulesanpham|admin-dich-vu|~/admin_page/module_function/module_DichVu.aspx");
        list.Add("modulesanphamdonggia|admin-mau-nails|~/admin_page/module_function/module_MauNails.aspx");
        list.Add("modulenailsbox|admin-nails-box|~/admin_page/module_function/module_NailsBox.aspx");
        list.Add("moduledonggia|admin-dong-gia|~/admin_page/module_function/module_DongGia.aspx");
        list.Add("modulexuhuong|admin-xu-huong|~/admin_page/module_function/module_XuHuong.aspx");
        //Quản lý chi nhánh
        list.Add("modulethongtinchinhanh|admin-thong-tin-chi-nhanh|~/admin_page/module_function/module_ThongTinChiNhanh.aspx");
        list.Add("modulethongtinchinhanhimage|admin-thong-tin-chi-nhanh-image-{thongtinchinhanh_id}|~/admin_page/module_function/module_ThongTinChiNhanhImage.aspx");

        //Quản lý giảm giá
        list.Add("modulemagiamgia|admin-ma-giam-gia|~/admin_page/module_function/module_MaGiamGia.aspx");
        list.Add("moduleloaimagiamgia|admin-loai-ma-giam-gia|~/admin_page/module_function/module_LoaiMaGiamGia.aspx");
        //Thông tin liên hệ
        list.Add("modulethongtinlienhe|admin-thong-tin-lien-he|~/admin_page/module_function/module_ThongTinLienHe.aspx");
        //Khách hàng
        list.Add("modulekhachhang|admin-khach-hang|~/admin_page/module_function/module_KhachHang.aspx");
        //Quản lý đánh giá
        list.Add("moduledanhgia|admin-danh-gia|~/admin_page/module_function/module_DanhGia.aspx");
        list.Add("moduledanhgiadichvu|admin-danh-gia-dich-vu-{dichvu_id}|~/admin_page/module_function/module_DanhGiaDichVu.aspx");
        list.Add("moduledanhgiasanpham|admin-danh-gia-theo-khach-hang|~/admin_page/module_function/module_DanhGiaSanPham.aspx");

        //Quản lý thanh toán
        list.Add("modulehoadonthanhtoan|admin-hoa-don-thanh-toan|~/admin_page/module_function/module_HoaDonThanhToan/module_HoaDonThanhToan.aspx");
        list.Add("modulexulyhoadonthanhtoan|admin-xu-ly-hoa-don-thanh-toan-{hoadon_id}|~/admin_page/module_function/module_HoaDonThanhToan/module_XuLyHoaDonThanhToan.aspx");
        list.Add("moduleinhoadon|admin-in-hoa-don-{id}|~/admin_page/module_bill/module_InBill.aspx");
        list.Add("modulehoadondain|admin-hoa-don-da-in|~/admin_page/module_bill/module_DanhSachHoaDonDaIn.aspx");
        list.Add("moduleinhoadontest|admin-test|~/admin_page/module_bill/Default.aspx");
        return list;
    }
}