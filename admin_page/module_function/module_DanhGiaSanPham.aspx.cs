using DevExpress.Web.ASPxHtmlEditor;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_DanhGiaSanPham : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    private int _id;
    
    public string image;
    protected void Page_Load(object sender, EventArgs e)
    {
        // Kiểm trả session login nếu khác null thì vào form xử lý
       // edtnoidung.Toolbars.Add(HtmlEditorToolbar.CreateStandardToolbar1());
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
        var getData = from ct in db.tb_DanhGiaChiTiets
                      join dg in db.tb_DanhGias on ct.danhgiachitiet_id equals dg.danhgia_id
                      join kh in db.tb_KhachHangs on dg.khachhang_id equals kh.khachhang_id
                      orderby kh.khachhang_id ascending
                      select new
                      {
                          ct.danhgiachitiet_id,
                          ct.danhgiachitiet_image,
                          ct.danhgiachitiet_noidung,
                          ct.danhgiachitiet_binhchon,
                          kh.khachhang_name,
                          ct.danhgiachitiet_ngaylap,
                          tinhtrang= ct.danhgiachitiet_hidden == false ?"Ẩn":"Hiển thị",
                          ct.danhgiachitiet_hidden
                      };
        // đẩy dữ liệu vào gridivew
        grvList.DataSource = getData;
        grvList.DataBind();
    }
   
    protected void btnHienThi_Click(object sender, EventArgs e)
    {
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "danhgiachitiet_id" });
        if (selectedKey.Count > 0)
        {
            foreach (var item in selectedKey)
            {
               
                tb_DanhGiaChiTiet update = db.tb_DanhGiaChiTiets.Where(x => x.danhgiachitiet_id == Convert.ToInt32(item) ).FirstOrDefault();
               if(update.danhgiachitiet_hidden == true)
                {
                    update.danhgiachitiet_hidden = false;
                }else
                update.danhgiachitiet_hidden = true;

                try
                {
                    db.SubmitChanges();
                    alert.alert_Success(Page, "Thành công", "");
                }
                catch
                {
                    alert.alert_Error(Page, "Thất bại", "");
                }
            }
        }
        else
            alert.alert_Warning(Page, "Bạn chưa chọn dữ liệu", "");
    }

    protected void btnXoa_Click(object sender, EventArgs e)
    {

    }

    protected void btnChiTiet_Click(object sender, EventArgs e)
    {

    }

    protected void btnThem_Click(object sender, EventArgs e)
    {

    }
}