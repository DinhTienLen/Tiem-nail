using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebSiteMasterPage : System.Web.UI.MasterPage
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public string count_datlich, count_giohang, count_traitim;
    protected void Page_Load(object sender, EventArgs e)
    {
        cls_KhachHang cls = new cls_KhachHang();
        if (cls.Check_KhachHang(Request.Cookies["phone"].Value))
        {
            if (!IsPostBack)
                loadData();
        }
        else
        {
            Response.Redirect("/app-login");
        }
    }
    protected void loadData()
    {
        var getIDKhachHang = from kh in db.tb_KhachHangs where kh.khachhang_sodienthoai == Request.Cookies["phone"].Value select kh;
        var getDataDatLich = from hdt in db.tb_HoaDons
                             join hdctt in db.tb_HoaDonChiTiets on hdt.hoadon_id equals hdctt.hoadon_id
                             join sp in db.tb_SanPhams on hdctt.sanpham_id equals sp.sanpham_id
                             where hdt.khachhang_id == getIDKhachHang.FirstOrDefault().khachhang_id
                             && hdt.hoadon_hidden == "Tạo đặt lịch" && hdt.hoadontam_LoaiThanhToan == "Đặt lịch" && hdt.hoadon_tinhtrang == "Order"
                             select hdctt;
        count_datlich = getDataDatLich.Count() + "";
        var getDataGioHang = from hdt in db.tb_HoaDons
                             join hdctt in db.tb_HoaDonChiTiets on hdt.hoadon_id equals hdctt.hoadon_id
                             join sp in db.tb_SanPhams on hdctt.sanpham_id equals sp.sanpham_id
                             where hdt.khachhang_id == getIDKhachHang.FirstOrDefault().khachhang_id
                             && hdt.hoadon_hidden == "Tạo giỏ hàng" && hdt.hoadontam_LoaiThanhToan == "Giỏ hàng" && hdt.hoadon_tinhtrang == "Order"
                             select hdctt;
        count_giohang = getDataGioHang.Count() + "";
        var getDataTraiTim = from tt in db.tb_Hearts
                             where tt.khachhang_id == getIDKhachHang.FirstOrDefault().khachhang_id
                             select tt;
        count_traitim = getDataTraiTim.Count() + "";
    }
}
