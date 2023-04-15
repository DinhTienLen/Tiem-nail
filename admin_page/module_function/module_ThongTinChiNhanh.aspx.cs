using DevExpress.Web.ASPxHtmlEditor;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_ThongTinChiNhanh : System.Web.UI.Page
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
        var getData = from cn in db.tb_ThongTinChiNhanhs
                      orderby cn.thongtinchinhanh_id descending
                      select new
                      {
                          cn.thongtinchinhanh_id,
                          cn.thongtinchinhanh_name,
                          cn.thongtinchinhanh_image,
                          cn.thongtinchinhanh_diachi,
                          cn.thongtinchinhanh_sodiemthoai
                      };
        // đẩy dữ liệu vào gridivew
        grvList.DataSource = getData;
        grvList.DataBind();
    }
    private void setNULL()
    {
        txtTenchinhanh.Text = "";
        txtSodienthoai.Text = "";
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
        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "thongtinchinhanh_id" }));
        // đẩy id vào session
        Session["_id"] = _id;
        var getData = (from cn in db.tb_ThongTinChiNhanhs
                       where cn.thongtinchinhanh_id == _id
                       select new
                       {
                           cn.thongtinchinhanh_name,
                           cn.thongtinchinhanh_image,
                           cn.thongtinchinhanh_diachi,
                           cn.thongtinchinhanh_sodiemthoai
                       }).Single();
        txtTenchinhanh.Text = getData.thongtinchinhanh_name;
        txtSodienthoai.Text = getData.thongtinchinhanh_sodiemthoai;
        txtdiachi.Text = getData.thongtinchinhanh_diachi;
        txtImage.Value = getData.thongtinchinhanh_image;
            image = getData.thongtinchinhanh_image;
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show();showImg1_1('" + image + "'); ", true);
    } 
    protected void btnXoa_Click(object sender, EventArgs e)
    {
        cls_ThongTinChiNhanh cls;
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "thongtinchinhanh_id" });
        if (selectedKey.Count > 0)
        {
            foreach (var item in selectedKey)
            {
                cls = new cls_ThongTinChiNhanh();
                if (cls.Xoa_ThongTinChiNhanh(Convert.ToInt32(item)))
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
        if (txtTenchinhanh.Text != "")
            return true;
        else return false;
    }

    protected void btnLuu_Click(object sender, EventArgs e)
    {
        cls_ThongTinChiNhanh cls = new cls_ThongTinChiNhanh();
        if (Page.IsValid && FileUpload1.HasFile)
        {
            string filename = (FileUpload1.FileName);
            string fileName_save = Path.Combine(Server.MapPath("~/uploadimages"), filename);
            FileUpload1.SaveAs(fileName_save);
            image = "/uploadimages/" + filename;
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
                if (cls.Them_ThongTinChiNhanh(txtTenchinhanh.Text,txtdiachi.Text, image, txtSodienthoai.Text, edtnoidunggioithieu.Html))
                {
                    alert.alert_Success(Page, "Thêm thành công", "");
                    popupControl.ShowOnPageLoad = false;
                }
                else alert.alert_Error(Page, "Thêm thất bại", "");
            }
            else
            {
                   
                if (cls.Sua_ThongTinChiNhanh(Convert.ToInt32(Session["_id"].ToString()), txtTenchinhanh.Text, txtdiachi.Text, image, txtSodienthoai.Text, edtnoidunggioithieu.Html))
                {
                    alert.alert_Success(Page, "Cập nhật thành công", "");
                    popupControl.ShowOnPageLoad = false;
                }
                else alert.alert_Error(Page, "Cập nhật thất bại", "");
            }
            loadData();
        }
    }

    protected void btnThemHinhAnh_Click(object sender, EventArgs e)
    {
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "thongtinchinhanh_id" });
        if(selectedKey.Count == 1)
        {
            Response.Redirect("admin-thong-tin-chi-nhanh-image-" + selectedKey[0]);
        }else if (selectedKey.Count > 1)
        {
            alert.alert_Warning(Page, "Bạn chỉ được chọn 1 chi nhánh ", "");
        }
        else
        {
            alert.alert_Warning(Page, "Bạn chưa chọn chi nhánh ", "");

        }
    }
}