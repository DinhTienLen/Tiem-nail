using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_app_web_DatLich : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        var listHoaDon = from hd in db.tb_HoaDons where hd.hoadon_id == Convert.ToInt32(RouteData.Values["id"]) select hd;
        rpHoaDon.DataSource = listHoaDon;
        rpHoaDon.DataBind();
        rpHoaDonTongTien.DataSource = listHoaDon;
        rpHoaDonTongTien.DataBind();
        var listHoaDonChiTiet = from hdct in db.tb_HoaDonChiTiets 
                                join sp in db.tb_SanPhams on hdct.sanpham_id equals sp.sanpham_id
                                where hdct.hoadon_id == Convert.ToInt32(RouteData.Values["id"])
                                select new { 
                                hdct.hoadonchitiet_soluong,
                                thanhtien = hdct.hoadonchitiet_soluong * hdct.hoadonchitiet_dongia,
                                sp.sanpham_name
                                };
        rpHoaDonChiTiet.DataSource = listHoaDonChiTiet;
        rpHoaDonChiTiet.DataBind();
    }
}