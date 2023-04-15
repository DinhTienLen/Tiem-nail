using DevExpress.Web.ASPxHtmlEditor;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_Slide : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    public string image;
    private int _id;
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
        var getData = from cn in db.tb_Slides
                      orderby cn.slide_id descending
                      select new
                      {
                          cn.slide_id,
                          cn.slide_image,
                      };
        // đẩy dữ liệu vào gridivew
        grvList.DataSource = getData;
        grvList.DataBind();
    }
    private void setNULL()
    {
       
    }
    protected void btnThem_Click(object sender, EventArgs e)
    {
        // Khi nhấn nút thêm thì mặc định session id = 0 để thực hiện thêm mới
        Session["_id"] = 0;
        // gọi hàm setNull để trả toàn bộ các control về rỗng
        setNULL();
        //Show popupcontrol
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Insert", "popupControl.Show();", true);
        loadData();
    }
    protected void btnChiTiet_Click(object sender, EventArgs e)
    {
        // Lấy value từ việc click vào 1 dòng của gridview
        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "slide_id" }));
        // đẩy id vào session
        Session["_id"] = _id;
        var getData = (from cn in db.tb_Slides
                       where cn.slide_id == _id
                       select new
                       {
                           cn.slide_image,
                       }).Single();
        txtImage.Value = getData.slide_image;
            image = getData.slide_image;
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show();showImg1_1('" + image + "'); ", true);
    } 
    protected void btnXoa_Click(object sender, EventArgs e)
    {
        cls_Slide cls;
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "slide_id" });
        if (selectedKey.Count > 0)
        {
            foreach (var item in selectedKey)
            {
                cls = new cls_Slide();
                if (cls.Xoa_Slide(Convert.ToInt32(item)))
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

    //public bool checknull()
    //{
    //    if (txtTenslide.Text != "")
    //        return true;
    //    else return false;
    //}

    protected void btnLuu_Click(object sender, EventArgs e)
    {
        cls_Slide cls = new cls_Slide();
        if (Page.IsValid && FileUpload1.HasFile)
        {
            string filename = (FileUpload1.FileName);
            string fileName_save = Path.Combine(Server.MapPath("~/uploadimages/QuanLySlide/"), filename);
            FileUpload1.SaveAs(fileName_save);
            image = "/uploadimages/QuanLySlide/" + filename;
        }
        else
        {
            image = txtImage.Value;
        }
        //if (checknull() == false)
        //    alert.alert_Warning(Page, "Nhập đầy đủ thông tin!", "");
        //else
        //{
            //if (image == null)
            //    image = "/admin_images/Preview-icon.png";
            if (Session["_id"].ToString() == "0")
            {
                if (cls.Them_Slide( image))
                {
                    alert.alert_Success(Page, "Thêm thành công", "");
                    popupControl.ShowOnPageLoad = false;
                }
                else alert.alert_Error(Page, "Thêm thất bại", "");
            }
            else
            {
                   
                if (cls.Sua_Slide(Convert.ToInt32(Session["_id"].ToString()), image))
                {
                    alert.alert_Success(Page, "Cập nhật thành công", "");
                    popupControl.ShowOnPageLoad = false;
                }
                else alert.alert_Error(Page, "Cập nhật thất bại", "");
            }
            loadData();
        //}
    }
}