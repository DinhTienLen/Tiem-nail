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
        var getData = from cn in db.tb_KhachHangs
                      where cn.hidden == false
                      select new
                      {
                          cn.khachhang_id,
                          cn.khachhang_name,
                          cn.khachhang_gmail,
                          cn.khachhang_ngaysinh,
                          cn.khachhang_sodienthoai,
                      };
        // đẩy dữ liệu vào gridivew
        grvList.DataSource = getData;
        grvList.DataBind();
    }
    private void setNULL()
    {
        txtTenKhachHang.Text = "";
        txtGmail.Text = "";
        txtSDT.Text = "";
        dteNgaySinh.Value = "";
    }
    protected void btnThem_Click(object sender, EventArgs e)
    {
        Session["_id"] = 0;
        setNULL();
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Insert", "popupControl.Show();", true);
        loadData();
    }
    protected void btnChiTiet_Click(object sender, EventArgs e)
    {
        // Lấy value từ việc click vào 1 dòng của gridview
        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "khachhang_id" }));
        // đẩy id vào session
        Session["_id"] = _id;
        var getData = (from cn in db.tb_KhachHangs
                       where cn.khachhang_id == _id
                       select new
                       {
                           cn.khachhang_name,
                           cn.khachhang_gmail,
                           cn.khachhang_ngaysinh,
                           cn.khachhang_sodienthoai,
                           cn.khachhang_password,
                       }).Single();
        txtTenKhachHang.Text = getData.khachhang_name;
        txtGmail.Text = getData.khachhang_gmail;
        dteNgaySinh.Value = getData.khachhang_ngaysinh.Value.ToString("yyyy-MM-dd").Replace(' ', 'T');
        txtSDT.Text = getData.khachhang_sodienthoai;

        txtGmail.ReadOnly = true;
        txtTenKhachHang.ReadOnly = true;
        dteNgaySinh.Disabled = true;
        txtSDT.ReadOnly = true;
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show();", true);
    } 
    protected void btnXoa_Click(object sender, EventArgs e)
    {
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "khachhang_id" });
        if (selectedKey.Count > 0)
        {
            foreach (var item in selectedKey)
            {
                if (cls.Xoa_KhachHang(Convert.ToInt32(item)))
                {
                    alert.alert_Success(Page, "Xóa thành công", "");
                }
                else
                    alert.alert_Error(Page, "Xóa thất bại", "");
            }
        }
        else
            alert.alert_Warning(Page, "Bạn chưa chọn dữ liệu", "");
    }

    public bool checknull()
    {
        if (txtTenKhachHang.Text != "" && txtGmail.Text != "" && txtSDT.Text != "" && dteNgaySinh.Value != "")
            return true;
        else return false;
    }
}