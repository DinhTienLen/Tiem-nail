using DevExpress.Web.ASPxHtmlEditor;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_KhachHang : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    public string image;
    private int _id;
    cls_KhachHang cls = new cls_KhachHang();
    protected void Page_Load(object sender, EventArgs e)
    {
        // Kiểm tra session login nếu khác null thì vào form xử lý
        if (Request.Cookies["UserName"].Value != null)
        {
            if (!IsPostBack)
            {
                Session["_id"] = 0;
            }
            loadData();
        }
        // nếu session = null thì trả về trang login
        else
        {
            Response.Redirect("/admin-login");
        }

    }
    private void loadData()
    {
        // load data đổ vào var danh sách(grv)
        var getData = from mkh in db.tb_MaGiamGiaCuaKhachHangs
                      join kh in db.tb_KhachHangs on mkh.khachhang_id equals kh.khachhang_id
                      join mg in db.tb_MaGiamGias on mkh.magiamgia_id equals mg.magiamgia_id
                      where mkh.khachhang_id == kh.khachhang_id && mkh.magiamgia_id == mg.magiamgia_id && mg.magiamgia_hiden == false && mg.magiamgia_owned == true 
                      select new
                      {
                          mg.magiamgia_id,
                          kh.khachhang_name,
                          mg.magiamgia_name,
                          mg.magiamgia_ngaybatdau,
                          mg.magiamgia_ngayketthuc,
                          mg.magiamgia_noidung,
                          magiamgia_soluong = (from mgg in db.tb_MaGiamGias where mgg.magiamgia_owned == true && mgg.magiamgia_khachhangid == mkh.khachhang_id && mgg.magiamgia_hiden == false select mgg).Count(),
                      };
        // đẩy dữ liệu vào gridivew
        grvList.DataSource = getData;
        grvList.DataBind();
    }
}