using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_app_web_SanPhamYeuThich : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["phone"].Value != null)
        {
            loadData();
        }
        else
        {
            Response.Redirect("web_Login.aspx");
        }
    }
    private void loadData()
    {
        var getKH = (from kh in db.tb_KhachHangs
                     where kh.khachhang_sodienthoai == Request.Cookies["phone"].Value
                     select kh).FirstOrDefault();
        var getData = from sp in db.tb_SanPhams
                      join st in db.tb_Hearts on sp.sanpham_id equals st.sanpham_id
                      where st.khachhang_id == getKH.khachhang_id
                      select new {
                          sp.sanpham_id,
                          sp.sanpham_name,
                          sp.sanpham_image,
                          tinhtrang = (from gh in db.tb_HoaDonChiTiets
                                       join hd in db.tb_HoaDons on gh.hoadon_id equals hd.hoadon_id
                                       where hd.khachhang_id == getKH.khachhang_id && gh.sanpham_id == sp.sanpham_id
                                       && hd.hoadon_tinhtrang == "Order"
                                       select gh).Count() > 0 ? "Đã thêm" : "Đặt lịch",
                          heart = (from h in db.tb_Hearts
                                   join kh in db.tb_KhachHangs on h.khachhang_id equals kh.khachhang_id
                                   join sp1 in db.tb_SanPhams on h.sanpham_id equals sp1.sanpham_id
                                   where h.khachhang_id == getKH.khachhang_id && h.sanpham_id == sp.sanpham_id
                                   select h).Count() > 0 ? "fa-heart" : "fa-heart-o"
                      };
        rpSanPham.DataSource = getData;
        rpSanPham.DataBind();
    }

    protected void btnChonSanPham_ServerClick(object sender, EventArgs e)
    {
        cls_TaoBill taoBill = new cls_TaoBill();
        if (taoBill.tao_Bill(Convert.ToInt32(txtSanPham.Value), Request.Cookies["phone"].Value))
        {
            alert.alert_Success(Page, "Đã lưu vào đặt lịch", "");
        }
        else
        {
            alert.alert_Error(Page, "Dịch vụ này đã có trong đặt lịch", "");
        }
        loadData();
    }
    protected void btnLuuYeuThich_ServerClick(object sender, EventArgs e)
    {
        var getkh = (from kh in db.tb_KhachHangs
                     where kh.khachhang_sodienthoai == Request.Cookies["phone"].Value
                     select kh).FirstOrDefault();
        tb_Heart delete = (from h in db.tb_Hearts
                          where h.sanpham_id == Convert.ToInt32(txtSanPhamYeuThich.Value) && h.khachhang_id == getkh.khachhang_id
                          select h).FirstOrDefault();
        db.tb_Hearts.DeleteOnSubmit(delete);
        db.SubmitChanges();
        loadData();
    }
}