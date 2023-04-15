using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_app_web_ChonMenuDichVu : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();

    protected void Page_Load(object sender, EventArgs e)
    {
        cls_KhachHang cls = new cls_KhachHang();
        if (cls.Check_KhachHang(Request.Cookies["phone"].Value))
        {
            loadData();
        }
        else
        {
            Response.Redirect("/app-login");
        }
    }
    protected void loadData()
    {
        var getData = from ldv in db.tb_LoaiSanPhams
                      where ldv.sanpham_parent == "dichvu"
                      select ldv;
        rpNhomDichVu.DataSource = getData;
        rpNhomDichVu.DataBind();
    }
    protected void rpNhomDichVu_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Repeater rpDichVuItem = e.Item.FindControl("rpDichVuItem") as Repeater;
        string loaidichvu_id = DataBinder.Eval(e.Item.DataItem, "loaisanpham_id").ToString();
        var getIDKhachHang = from kh in db.tb_KhachHangs where kh.khachhang_sodienthoai == Request.Cookies["phone"].Value select kh;
        var getDataDV = from d in db.tb_SanPhams
                        join l in db.tb_LoaiSanPhams on d.loaisanpham_id equals l.loaisanpham_id
                        where d.loaisanpham_id == Convert.ToInt32(loaidichvu_id)
                        select new
                        {
                            d.sanpham_id,
                            d.sanpham_name,
                            d.sanpham_giatien,
                            l.loaisanpham_id,
                            l.loaisanpham_name,
                            sanpham_class = (from hdct in db.tb_HoaDonChiTiets
                                             join hd in db.tb_HoaDons on hdct.hoadon_id equals hd.hoadon_id
                                             where hdct.sanpham_id == d.sanpham_id && hd.hoadon_tinhtrang == "Order" && hd.khachhang_id == getIDKhachHang.FirstOrDefault().khachhang_id
                                             select hdct).Count() > 0 ? "" : "fa-plus-circle"

                        };
        rpDichVuItem.DataSource = getDataDV;
        rpDichVuItem.DataBind();
    }

    protected void btnChonSanPham_ServerClick(object sender, EventArgs e)
    {
        cls_TaoBill taoBill = new cls_TaoBill();
        if(taoBill.tao_Bill(Convert.ToInt32(txtSanPham.Value), Request.Cookies["phone"].Value))
        {
            alert.alert_Success(Page, "Đã lưu vào đặt lịch", "");
        }    
        else
        {
            alert.alert_Error(Page, "Dịch vụ này đã có trong đặt lịch", "");
        }    
        loadData();
    }
}