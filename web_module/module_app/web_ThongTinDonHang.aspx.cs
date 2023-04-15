using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_app_abc : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    public string TienTong;
    private int tongtien;
    protected void Page_Load(object sender, EventArgs e)
    {
        cls_KhachHang cls = new cls_KhachHang();
        if (cls.Check_KhachHang(Request.Cookies["phone"].Value))
        {
            getData();
        }
        else
        {
            Response.Redirect("/app-login");
        }
       
    }
    private void getData()
    {
        var getIDKhachHang = from kh in db.tb_KhachHangs where kh.khachhang_sodienthoai == Request.Cookies["phone"].Value select kh;
        var getDataDatLich = from hdt in db.tb_HoaDons
                             where hdt.khachhang_id == getIDKhachHang.FirstOrDefault().khachhang_id
                             && hdt.hoadon_tinhtrang!="Order"
                             //&& hdt.hoadon_hidden == "Tạo đặt lịch" && hdt.hoadontam_LoaiThanhToan == "Đặt lịch" 
                             select new
                             {
                                 hdt.hoadon_id,
                                 hdt.hoadon_code,
                                 hdt.hoadon_tinhtrang,
                                 hdt.hoadon_tongtien
                             };
        rpTatCa.DataSource = getDataDatLich;
        rpTatCa.DataBind();
        var getChoXacNhan = from hdt in db.tb_HoaDons
                            where hdt.khachhang_id == getIDKhachHang.FirstOrDefault().khachhang_id
                            && hdt.hoadon_tinhtrang == "Chờ xác nhận"
                            //&& hdt.hoadon_hidden == "Tạo đặt lịch" && hdt.hoadontam_LoaiThanhToan == "Đặt lịch" 
                            select new
                            {
                                hdt.hoadon_id,
                                hdt.hoadon_code,
                                hdt.hoadon_tinhtrang,
                                hdt.hoadon_tongtien
                            };
        if(getChoXacNhan.Count()>0)
        {
            rpChoXacNhan.DataSource = getChoXacNhan;
            rpChoXacNhan.DataBind();
        }    
        var getDaHoanThanh = from hdt in db.tb_HoaDons
                            where hdt.khachhang_id == getIDKhachHang.FirstOrDefault().khachhang_id
                            && hdt.hoadon_tinhtrang == "Đã hoàn thành"
                            //&& hdt.hoadon_hidden == "Tạo đặt lịch" && hdt.hoadontam_LoaiThanhToan == "Đặt lịch" 
                            select new
                            {
                                hdt.hoadon_id,
                                hdt.hoadon_code,
                                hdt.hoadon_tinhtrang,
                                hdt.hoadon_tongtien
                            };
        if (getDaHoanThanh.Count() > 0)
        {
            rpDaHoanThanh.DataSource = getDaHoanThanh;
            rpDaHoanThanh.DataBind();
        }
        var getDaHuy = from hdt in db.tb_HoaDons
                             where hdt.khachhang_id == getIDKhachHang.FirstOrDefault().khachhang_id
                             && hdt.hoadon_tinhtrang == "Đã hủy"
                             //&& hdt.hoadon_hidden == "Tạo đặt lịch" && hdt.hoadontam_LoaiThanhToan == "Đặt lịch" 
                             select new
                             {
                                 hdt.hoadon_id,
                                 hdt.hoadon_code,
                                 hdt.hoadon_tinhtrang,
                                 hdt.hoadon_tongtien
                             };
        if (getDaHuy.Count() > 0)
        {
            rpDaHuy.DataSource = getDaHuy;
            rpDaHuy.DataBind();
        }
        // tongtien = Convert.ToInt32(getDataDatLich.Sum(x => x.thanhtien));
        // TienTong = String.Format("{0:#,0.##} {1}", Convert.ToDouble(tongtien.ToString()), "đ");
    }    
}