using DevExpress.Web.ASPxHtmlEditor;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_ThongTinChiNhanhImage : System.Web.UI.Page
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
            _id = Convert.ToInt32(RouteData.Values["thongtinchinhanh_id"]);
            if (!IsPostBack)
            {
                Session["_id"] = 0;
            }
            loadImage();
        }
        else
        {
            Response.Redirect("/admin-login");
        }

    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        cls_ThongTinChiNhanhImage cls = new cls_ThongTinChiNhanhImage();
        String folderUser = Server.MapPath("~/uploadimages/anh_chinhanh/");
        if (!Directory.Exists(folderUser))
        {
            Directory.CreateDirectory(folderUser);
        }
        string filename;
        string ulr = "/uploadimages/anh_chinhanh/";
        HttpFileCollection hfc = Request.Files;
        for (int i = 0; i < hfc.Count; i++)
        {
            HttpPostedFile hpf = hfc[i];
            if (hpf.ContentLength > 0)
            {
                filename = ulr + Path.GetRandomFileName() + Path.GetExtension(hpf.FileName);
                string path = HttpContext.Current.Server.MapPath("~/" + filename);
                hpf.SaveAs(path);
                cls.Them_Image(_id, filename);
            }
        }
        loadImage();
        btnUploadAllImage.Visible = true;
        btn_HoanThanh.Visible = true;
    }
    private void loadImage()
    {
        rpImageListing.DataSource = from xhi in db.tb_ThongTinChiNhanhImages
                                    where xhi.thongtinchinhanh_id == _id
                                    select xhi;
        rpImageListing.DataBind();
    }
    protected void btnXoaImage_ServerClick(object sender, EventArgs e)
    {
        try
        {
            tb_ThongTinChiNhanhImage del = (from i in db.tb_ThongTinChiNhanhImages
                                   where i.thongtinchinhanhimage_id == Convert.ToInt32(txtImage.Value) 
                                                     select i).SingleOrDefault();
            delete(del.thongtinchinhanhimage_image);
            db.tb_ThongTinChiNhanhImages.DeleteOnSubmit(del);
            db.SubmitChanges();
            loadImage();
        }
        catch (Exception ex)
        {
            alert.alert_Error(Page, "Error", "");
        }
    }
    public void delete(string sFileName)
    {
        if (sFileName != String.Empty)
        {
            if (File.Exists(sFileName))

                File.Delete(sFileName);
        }
    }
}