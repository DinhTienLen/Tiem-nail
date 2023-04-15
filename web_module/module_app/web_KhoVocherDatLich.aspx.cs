using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_app_web_KhoVocherDatLich : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    public string voucherkhachhang = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        cls_KhachHang cls = new cls_KhachHang();
        if (cls.Check_KhachHang(Request.Cookies["phone"].Value))
        {
            // mã giảm giá = 7 là Mã giảm giá dịch vụ tại Sala Beauty
            var getIDKhachHang = from kh in db.tb_KhachHangs where kh.khachhang_sodienthoai == Request.Cookies["phone"].Value select kh;
           var getMaGiamGia = from mb in db.tb_MaGiamGias
                                           join mkh in db.tb_MaGiamGiaCuaKhachHangs on mb.magiamgia_id equals mkh.magiamgia_id
                                           where mb.loaigiamgia_id == 7 && mkh.khachhang_id == getIDKhachHang.FirstOrDefault().khachhang_id && mb.magiamgia_ngayketthuc >= DateTime.Now && mkh.magiagiacuakhachhanghang_tinhtrang == true
                                           select new
                                           {
                                               mkh.magiamgiacuakhachhang_id,
                                               mb.magiamgia_id,
                                               mb.magiamgia_ngaybatdau,
                                               mb.magiamgia_ngayketthuc,
                                               mb.magiamgia_name,
                                               mb.magiamgia_sogiam,
                                               //chon = (from mkhc in db.tb_MaGiamGiaCuaKhachHangs
                                               //        where voucherkhachhang.Contains(mkhc.magiamgiacuakhachhang_id.ToString())
                                               //        select mkhc).Count() > 0 ? "Chọn" : "Đã chọn"
                                           };
            if(getMaGiamGia.Count()>0)
            {
                rpMaKhachHangSala.DataSource = getMaGiamGia;
                rpMaKhachHangSala.DataBind();
                lblMaGiamGia.Text = "Mã giảm giá mua hàng online";
            }
            else
            {
                lblMaGiamGia.Text = "Không có mã giảm giá trong kho";
            }    
           
           
        }
        else
        {
            Response.Redirect("/app-login");
        }
    }

    protected void btnLuu_ServerClick(object sender, EventArgs e)
    {
        tb_MaGiamGiaCuaKhachHang update = (from mkh in db.tb_MaGiamGiaCuaKhachHangs
                                           where mkh.magiamgiacuakhachhang_id == Convert.ToInt32(txtMaVach.Value) && mkh.magiagiacuakhachhanghang_tinhtrang == true
                                           select mkh).Single();
        //update.magiagiacuakhachhanghang_tinhtrang = false;
        //db.SubmitChanges();
        voucherkhachhang = update.magiamgiacuakhachhang_id + "";
        Session["vourcher"] = voucherkhachhang;
        Response.Redirect("/hoa-don-dat-lich");

    }
}