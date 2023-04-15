using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_QuanLySlides_module_QuanLySlide : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    public string image;
    private int _id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["_id"] = 0;
        }
        loadData();
    }

    private void loadData()
    {
        var getSlide = from qls in db.tb_QuanLySlides
                       orderby qls.slide_create descending
                       select new
                       {
                           qls.slide_id,
                           qls.slide_create,
                           qls.slide_img,
                           qls.slide_content,
                           qls.slide_hidden
                       };
        rpBangSlide.DataSource = getSlide;
        rpBangSlide.DataBind();
    }
    protected void btnXoa_ServerClick(object sender, EventArgs e)
    {
        cls_ThongTinSlide cls;
        List<object> selectedKey = rpBangSlide.GetSelectedFieldValues(new string[] { "slide_id" });
        if (selectedKey.Count > 0)
        {
            foreach (var item in selectedKey)
            {
                cls = new cls_ThongTinSlide();
                if (cls.Xoa_ThongTinSlide(Convert.ToInt32(item)))
                {
                    alert.alert_Success(Page, "Xóa thành công", "");
                }
                else
                    alert.alert_Error(Page, "Xóa thất bại", "");
            }
        }
        else
        {
            alert.alert_Warning(Page, "Bạn chưa chọn dữ liệu", "");
        }
        loadData();
    }

    protected void btnSua_ServerClick(object sender, EventArgs e)
    {
        //_id = Convert.ToInt32(rpBangSlide.GetRowValues(rpBangSlide.FocusedRowIndex, new string[] { "thongtinchinhanh_id" }));
        //Session["_id"] = _id;
        //var getData = (from qls in db.tb_QuanLySlides
        //              where qls.slide_id == _id
        //              select new
        //              {
        //                  qls.slide_id,
        //                  qls.slide_img,
        //                  qls.slide_content
        //              }).Single();
        //txtNoiDung.Text = getData.slide_content;
        //image = getData.slide_img;
        //ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show();showImg1_1('" + image + "'); ", true);
    }

    protected void btnThem_ServerClick(object sender, EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Insert", "popupControl.Show();", true);
    }

    protected void btnLuu_Click(object sender, EventArgs e)
    {
        cls_ThongTinSlide cls = new cls_ThongTinSlide();
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
        //if (image == null)
        //    image = "/admin_images/Preview-icon.png";
        if (Session["_id"].ToString() == "0")
        {
            if (cls.Them_ThongTinSlide(txtDay.Value, image, txtNoiDung.Text, "False"))
            {
                alert.alert_Success(Page, "Thêm thành công", "");
                popupControl.ShowOnPageLoad = false;
            }
            else alert.alert_Error(Page, "Thêm thất bại", "");
        }
        //else
        //{

        //    if (cls.Them_ThongTinSlide(txtDay.Value, image, txtNoiDung.Text, "False"))
        //    {
        //        alert.alert_Success(Page, "Cập nhật thành công", "");
        //        popupControl.ShowOnPageLoad = false;
        //    }
        //    else alert.alert_Error(Page, "Cập nhật thất bại", "");
        //}
        loadData();
    }

    protected void btnTime_ServerClick(object sender, EventArgs e)
    {
        if (txtDate.Value == "")
        {
            loadData();
        }
        else
        {
            var getSlide = from qls in db.tb_QuanLySlides
                           where qls.slide_create == Convert.ToDateTime(txtDate.Value)
                           select new
                           {
                               qls.slide_id,
                               qls.slide_create,
                               qls.slide_img,
                               qls.slide_content,
                           };
            rpBangSlide.DataSource = getSlide;
            rpBangSlide.DataBind();
        }
    }
}