using DevExpress.Web.ASPxHtmlEditor;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_LoaiSanPham : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    private int _id;
    private string image;
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
        var getData = from nc in db.tb_LoaiSanPhams
                      where nc.sanpham_parent == "albummaunails"
                      orderby nc.loaisanpham_id descending
                      select new
                      {
                          nc.loaisanpham_id,
                          nc.loaisanpham_name,
                          nc.loaisanpham_image,
                          hidden = nc.loaisanpham_hidden == false ? "Còn" : "Không còn",
                          nc.title_web,
                          nc.meta_image,
                          nc.meta_keywords,
                          nc.meta_title,
                          nc.h1_seo,
                          nc.link_seo,
                          nc.sanpham_parent,
                          nc.meta_description,
                      };
        // đẩy dữ liệu vào gridivew
        grvList.DataSource = getData;
        grvList.DataBind();
    }
    private void setNULL()
    {
        txttenloai.Text = "";
        txtSEO_IMAGE.Text = "";
        txtSEO_KEYWORD.Text = "";
        txtSEO_LINK.Text = "";
        txt_SEOTITLE.Text = "";
        txtSEO_KEYWORD.Text = "";
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
        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "loaisanpham_id" }));
        // đẩy id vào session
        Session["_id"] = _id;
        var getData = (from nc in db.tb_LoaiSanPhams
                       where nc.loaisanpham_id == _id
                       select new
                       {
                           nc.loaisanpham_name,
                           nc.loaisanpham_image,
                           nc.sanpham_parent
                       }).Single();
        txttenloai.Text = getData.loaisanpham_name;
        image = getData.loaisanpham_image;
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show();showImg1_1('" + image + "'); ", true);


    }
    protected void btnXoa_Click(object sender, EventArgs e)
    {
        cls_LoaiSanPham cls;
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "loaisanpham_id" });
        if (selectedKey.Count > 0)
        {
            foreach (var item in selectedKey)
            {
                cls = new cls_LoaiSanPham();
                if (cls.Xoa_LoaiSanPham(Convert.ToInt32(item)))
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
        if (txttenloai.Text != "")
            return true;
        else return false;
    }

    protected void btnLuu_Click(object sender, EventArgs e)
    {
        cls_LoaiSanPham cls = new cls_LoaiSanPham();
        if (Page.IsValid && FileUpload1.HasFile)
        {
            string filename = (FileUpload1.FileName);
            string fileName_save = Path.Combine(Server.MapPath("~/uploadimages/QuanLyNailBox/"), filename);
            FileUpload1.SaveAs(fileName_save);
            image = "/uploadimages/QuanLyNailBox/" + filename;
        }
        else
        {
            image = txtImage.Value;
        }
        if (checknull() == false)
            alert.alert_Warning(Page, "Nhập đầy đủ thông tin!", "");
        else
        {

            if (Session["_id"].ToString() == "0")
            {
                if (cls.Them_LoaiSanPham(txttenloai.Text, image, "albummaunails"))
                {
                    alert.alert_Success(Page, "Thêm thành công", "");
                    popupControl.ShowOnPageLoad = false;
                }
                else alert.alert_Error(Page, "Thêm thất bại", "");
            }
            else
            {

                if (cls.Sua_LoaiSanPham(Convert.ToInt32(Session["_id"].ToString()), txttenloai.Text, image))
                {
                    alert.alert_Success(Page, "Cập nhật thành công", "");
                    popupControl.ShowOnPageLoad = false;
                }
                else alert.alert_Error(Page, "Cập nhật thất bại", "");
            }
            loadData();
        }
    }


}