using DevExpress.Web.ASPxHtmlEditor;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_LoaiMaGiamGia : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    private int _id;
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
        // load data đổ vào var danh sách(grv)
        var getData = from nc in db.tb_LoaiMaGiamGias
                      orderby nc.loaimagiamgia_id descending
                      select new
                      { 
            nc.loaimagiamgia_id,
            nc.loaimagiamgia_name,
        };
        // đẩy dữ liệu vào gridivew
        grvList.DataSource = getData;
        grvList.DataBind();
    }
    private void setNULL()
    {
        txttenloai.Text = "";
    }
    protected void btnThem_Click(object sender, EventArgs e)
    {
        // Khi nhấn nút thêm thì mật định session id = 0 để thêm mới
        Session["_id"] = 0;
        // gọi hàm setNull để trả toàn bộ các control về rỗng
        setNULL();
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Insert", "popupControl.Show();", true);
    }
    protected void btnChiTiet_Click(object sender, EventArgs e)
    {
        // get value từ việc click vào gridview
        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "loaimagiamgia_id" }));
        // đẩy id vào session
        Session["_id"] = _id;
        var getData = (from nc in db.tb_LoaiMaGiamGias
                       where nc.loaimagiamgia_id == _id
                       select nc).Single();
        txttenloai.Text = getData.loaimagiamgia_name;
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show();", true);
       
    }
    protected void btnXoa_Click(object sender, EventArgs e)
    {
        cls_LoaiMaGiamGia cls;
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "loaimagiamgia_id" });
        if (selectedKey.Count > 0)
        {
            foreach (var item in selectedKey)
            {
                cls = new cls_LoaiMaGiamGia();
                if (cls.Xoa_LoaiMaGiamGia(Convert.ToInt32(item)))
                {
                    alert.alert_Success(Page, "Xóa thành công", "");
                   // ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "grvList.Refresh();", true);
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
        if (txttenloai.Text != "" )
            return true;
        else return false;
    }

    protected void btnLuu_Click(object sender, EventArgs e)
    {
        cls_LoaiMaGiamGia cls = new cls_LoaiMaGiamGia();
        if (checknull() == false)
            alert.alert_Warning(Page, "Nhập đầy đủ thông tin!", "");
        else
        {
            if (Session["_id"].ToString() == "0")
            {
                if (cls.Them_LoaiMaGiamGia( txttenloai.Text))
                {
                    alert.alert_Success(Page, "Thêm thành công", "");
                    popupControl.ShowOnPageLoad = false;
                    //   ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "grvList.Refresh();", true);
                }
                else alert.alert_Error(Page, "Thêm thất bại", "");
            }
            else
            {
                if (cls.Sua_LoaiMaGiamGia(Convert.ToInt32(Session["_id"].ToString()), txttenloai.Text))
                {
                    alert.alert_Success(Page, "Cập nhật thành công", "");
                    popupControl.ShowOnPageLoad = false;
                    //   ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "grvList.Refresh();", true);
                }
                else alert.alert_Error(Page, "Cập nhật thất bại", "");
            }
             loadData();
        }
    }
}