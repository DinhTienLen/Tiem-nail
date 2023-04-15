using DevExpress.Web.ASPxHtmlEditor;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_MauNails : System.Web.UI.Page
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
        //var getLoai = from sp in db.tb_SanPhams where sp.sanpham_parent == "sanpham" select sp;
        var getData = from sp in db.tb_SanPhams
                      join l in db.tb_LoaiSanPhams on sp.loaisanpham_id equals l.loaisanpham_id
                      where l.sanpham_parent == "albummaunails"
                      orderby sp.sanpham_id descending
                      select new
                      {
                          sp.sanpham_name,
                          sp.sanpham_news,
                          sp.sanpham_giatien,
                          sp.sanpham_image,
                          sp.sanpham_id,
                          l.loaisanpham_name
                      };
        // đẩy dữ liệu vào gridivew
        grvList.DataSource = getData;
        grvList.DataBind();
        ddlNhom.DataSource = from lsp in db.tb_LoaiSanPhams where lsp.sanpham_parent == "albummaunails" select lsp;
        ddlNhom.DataBind();              
      
    }
    private void setNULL()
    {
        txtTensanpham.Text = "";
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
        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "sanpham_id" }));
        // đẩy id vào session
        Session["_id"] = _id;
        var getData = (from sp in db.tb_SanPhams
                      join l in db.tb_LoaiSanPhams on sp.loaisanpham_id equals l.loaisanpham_id
                      where sp.sanpham_id == _id
                      orderby sp.sanpham_id descending
                      select new
                      {
                          sp.sanpham_name,
                          sp.sanpham_news,
                          sp.sanpham_giatien,
                          sp.sanpham_image,
                          sp.sanpham_id,
                          l.loaisanpham_name
                      }).Single();
        txtTensanpham.Text = getData.sanpham_name;
        txtImage.Value = getData.sanpham_image;
        ddlNhom.Text = getData.loaisanpham_name;
        image = getData.sanpham_image;
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show();showImg1_1('" + image + "'); ", true);
    }
    protected void btnXoa_Click(object sender, EventArgs e)
    {
        cls_SanPham cls;
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "sanpham_id" });
        if (selectedKey.Count > 0)
        {
            foreach (var item in selectedKey)
            {
                cls = new cls_SanPham();
                if (cls.Xoa_SanPham(Convert.ToInt32(item)))
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
        if (txtTensanpham.Text != "")
            return true;
        else return false;
    }

    protected void btnLuu_Click(object sender, EventArgs e)
    {
        cls_SanPham cls = new cls_SanPham();
        if (Page.IsValid && FileUpload1.HasFile)
        {
            string filename = (FileUpload1.FileName);
            string fileName_save = Path.Combine(Server.MapPath("~/uploadimages/anh_sanpham"), filename);
            FileUpload1.SaveAs(fileName_save);
            image = "/uploadimages/anh_sanpham/" + filename;
        }
        else
        {
            image = txtImage.Value;
        }
        if (checknull() == false)
            alert.alert_Warning(Page, "Nhập đầy đủ thông tin!", "");
        else
        {
            //if (image == null)
            //    image = "/admin_images/Preview-icon.png";
            if (Session["_id"].ToString() == "0")
            {
                if (cls.Them_SanPham(txtTensanpham.Text,"", 0, image, Convert.ToInt32(ddlNhom.Value)))
                {
                    alert.alert_Success(Page, "Thêm thành công", "");
                    popupControl.ShowOnPageLoad = false;
                }
                else alert.alert_Error(Page, "Thêm thất bại", "");
            }
            else
            {
              
                if (cls.Sua_SanPham(Convert.ToInt32(Session["_id"].ToString()), txtTensanpham.Text,"", 0, image, Convert.ToInt32(ddlNhom.Value)))
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