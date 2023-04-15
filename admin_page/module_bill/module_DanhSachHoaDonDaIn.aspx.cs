using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_bill_module_DanhSachHoaDonDaIn : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    protected int _id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["UserName"] != null)
        {
            if (!IsPostBack)
            {
                Session["_id"] = 0;
            }
            loadata();
        }
        else
        {
            Response.Redirect("/admin-login");
        }
    }

    protected void loadata()
    {
        var getData = from hd in db.tb_HoaDons
                      where hd.hoadon_tinhtrang != "Order" && hd.hoadon_tinhtrang_bill == "Đã in"
                      orderby hd.hoadon_id descending
                      //join dv in db.tb_DichVus on hd.dichvu_id equals dv.dichvu_id
                      select new
                      {
                          hd.hoadon_id,
                          hd.hoadon_code,
                          hd.hoadon_createdate,
                          hd.hoadon_sodienthoaikhachhang,
                          hd.hoadon_tongtien,
                          hd.hoadon_tinhtrang,
                          hd.hoadon_magiamgia,
                          hd.hoadon_diachigiaohang,
                          hd.hoadontam_LoaiThanhToan,
                          hd.hoadon_TenKhachHang,
                          hd.hoadon_phaitra,
                      };
        grvList.DataSource = getData;
        grvList.DataBind();
    }
}