using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_app_accc : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    protected void Page_Load(object sender, EventArgs e)
    {
        cls_KhachHang cls = new cls_KhachHang();
        if (cls.Check_KhachHang(Request.Cookies["phone"].Value))
        {
            // mã giảm giá = 7 là Mã giảm giá dịch vụ tại Sala Beauty
            var getIDKhachHang = from kh in db.tb_KhachHangs where kh.khachhang_sodienthoai == Request.Cookies["phone"].Value select kh;
            rpSalaBeauty.DataSource = from mb in db.tb_MaGiamGias
                                      where mb.loaigiamgia_id == 7 && mb.magiamgia_ngayketthuc>= DateTime.Now
                                      select new { 
                                      mb.magiamgia_id,
                                      mb.magiamgia_ngaybatdau,
                                      mb.magiamgia_ngayketthuc,
                                      mb.magiamgia_name,
                                      mb.magiamgia_sogiam,
                                      magiamgia_phantram = "style=width:"+ (((from mkh in db.tb_MaGiamGiaCuaKhachHangs where mkh.magiamgia_id == mb.magiamgia_id select mkh).Count() * 100) / (from m in db.tb_MaGiamGias where m.magiamgia_id == mb.magiamgia_id select m).SingleOrDefault().magiamgia_soluong).ToString() + "%"
                                      };
            rpSalaBeauty.DataBind();
            //mã giảm giá = 6 là Mã giảm giá mua hàng online ( Nails Box)
            rpOnline.DataSource = from mb in db.tb_MaGiamGias
                                  where mb.loaigiamgia_id == 6 && mb.magiamgia_ngayketthuc >= DateTime.Now
                                  select new {
                                      mb.magiamgia_id,
                                      mb.magiamgia_ngaybatdau,
                                      mb.magiamgia_ngayketthuc,
                                      mb.magiamgia_name,
                                      mb.magiamgia_sogiam,
                                      magiamgia_phantram = "style=width:" + (((from mkh in db.tb_MaGiamGiaCuaKhachHangs where mkh.magiamgia_id == mb.magiamgia_id select mkh).Count() * 100) / (from m in db.tb_MaGiamGias where m.magiamgia_id == mb.magiamgia_id select m).SingleOrDefault().magiamgia_soluong).ToString() + "%"

                                  };
            rpOnline.DataBind();
            rpMaKhachHangSala.DataSource = from mb in db.tb_MaGiamGias
                                           join mkh in db.tb_MaGiamGiaCuaKhachHangs on mb.magiamgia_id equals mkh.magiamgia_id
                                           where mb.loaigiamgia_id == 7  && mkh.khachhang_id == getIDKhachHang.FirstOrDefault().khachhang_id && mb.magiamgia_ngayketthuc >= DateTime.Now && mkh.magiagiacuakhachhanghang_tinhtrang == true
                                           select new
                                           {
                                               mb.magiamgia_id,
                                               mb.magiamgia_ngaybatdau,
                                               mb.magiamgia_ngayketthuc,
                                               mb.magiamgia_name,
                                               mb.magiamgia_sogiam,
                                           };
            rpMaKhachHangSala.DataBind();
            rpMaKhachHangOnline.DataSource = from mb in db.tb_MaGiamGias
                                             join mkh in db.tb_MaGiamGiaCuaKhachHangs on mb.magiamgia_id equals mkh.magiamgia_id
                                             where mb.loaigiamgia_id == 6 && mkh.khachhang_id == getIDKhachHang.FirstOrDefault().khachhang_id && mb.magiamgia_ngayketthuc >= DateTime.Now && mkh.magiagiacuakhachhanghang_tinhtrang == true
                                             select new
                                             {
                                                 mb.magiamgia_id,
                                                 mb.magiamgia_ngaybatdau,
                                                 mb.magiamgia_ngayketthuc,
                                                 mb.magiamgia_name,
                                                 mb.magiamgia_sogiam,
                                             };
            rpMaKhachHangOnline.DataBind();
        }
        else
        {
            Response.Redirect("/app-login");
        }
    }

    protected void btnLuu_ServerClick(object sender, EventArgs e)
    {
        var getIDKhachHang = from kh in db.tb_KhachHangs where kh.khachhang_sodienthoai == Request.Cookies["phone"].Value select kh;

        tb_MaGiamGiaCuaKhachHang checkMaKhachHang = (from m in db.tb_MaGiamGiaCuaKhachHangs
                                           where m.magiamgia_id == Convert.ToInt32(txtMaCode.Value) && m.khachhang_id== getIDKhachHang.FirstOrDefault().khachhang_id
                                           orderby m.magiamgia_id descending select m).FirstOrDefault();
       
        if (checkMaKhachHang != null)
        {
            alert.alert_Error(Page, "Quý khách đã có mã khuyến mãi rồi", "");
        }
        else
        {
            //update.magiamgia_hiden = true;
            tb_MaGiamGiaCuaKhachHang insert = new tb_MaGiamGiaCuaKhachHang();
            insert.magiamgia_id = Convert.ToInt32(txtMaCode.Value);
            insert.khachhang_id = Convert.ToInt32(getIDKhachHang.FirstOrDefault().khachhang_id);
            // tình trạng true để lưu vào kho
            insert.magiagiacuakhachhanghang_tinhtrang = true;
            db.tb_MaGiamGiaCuaKhachHangs.InsertOnSubmit(insert);
            db.SubmitChanges();
            alert.alert_Success(Page, "Đã lưu vào kho mã khách hàng", "");
        }

        rpSalaBeauty.DataSource = from mb in db.tb_MaGiamGias 
                                  where mb.loaigiamgia_id == 7 && mb.magiamgia_ngayketthuc >= DateTime.Now
                                  select new
                                  {
                                      mb.magiamgia_id,
                                      mb.magiamgia_ngaybatdau,
                                      mb.magiamgia_ngayketthuc,
                                      mb.magiamgia_name,
                                      mb.magiamgia_sogiam,
                                      magiamgia_phantram = "style=width:" + (((from mkh in db.tb_MaGiamGiaCuaKhachHangs where mkh.magiamgia_id == mb.magiamgia_id select mkh).Count() * 100) / (from m in db.tb_MaGiamGias where m.magiamgia_id == mb.magiamgia_id select m).SingleOrDefault().magiamgia_soluong).ToString() + "%"

                                  };
        rpSalaBeauty.DataBind();
        rpOnline.DataSource = from mb in db.tb_MaGiamGias
                              where mb.loaigiamgia_id == 6 && mb.magiamgia_ngayketthuc >= DateTime.Now
                              select new
                              {
                                  mb.magiamgia_id,
                                  mb.magiamgia_ngaybatdau,
                                  mb.magiamgia_ngayketthuc,
                                  mb.magiamgia_name,
                                  mb.magiamgia_sogiam,
                                  magiamgia_phantram = "style=width:" + (((from mkh in db.tb_MaGiamGiaCuaKhachHangs where mkh.magiamgia_id == mb.magiamgia_id select mkh).Count() * 100) / (from m in db.tb_MaGiamGias where m.magiamgia_id == mb.magiamgia_id select m).SingleOrDefault().magiamgia_soluong).ToString() + "%"

                              };
        rpOnline.DataBind();
    }
}