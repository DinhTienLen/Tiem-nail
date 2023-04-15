using DevExpress.Web.ASPxHtmlEditor;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_WebSite_module_News_Content : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    private int _id;
    string image;
    protected void Page_Load(object sender, EventArgs e)
    {
        edtnoidung.Toolbars.Add(HtmlEditorToolbar.CreateStandardToolbar1());
        if (!IsPostBack)
        {
            if (RouteData.Values["id"].ToString() != "0")
            {
                loadData();
            }
            ddlloaisanpham.DataSource = from tb in db.tb_NewsCates
                                        select tb;
            ddlloaisanpham.DataBind();
        }
    }
    private void loadData()
    {
        var getData = (from n in db.tb_News
                       join tb in db.tb_NewsCates on n.newscate_id equals tb.newscate_id
                       where n.news_id == Convert.ToInt32(RouteData.Values["id"].ToString())
                       select new
                       {
                           n.news_id,
                           n.news_title,
                           n.news_summary,
                           n.news_content,
                           tb.newscate_title,
                           tb.newscate_id,
                           n.news_image,
                           n.news_datecreate,
                           n.meta_keywords,
                           n.meta_title,
                           n.meta_description,
                           n.link_seo,
                           n.meta_image,
                       }).Single();
        txtTieuDe.Text = getData.news_title;
        ddlloaisanpham.Text = getData.newscate_title;
        edtnoidung.Html = getData.news_content;
        txttomtat.Text = getData.news_summary;
        dteNgayDang.Value = getData.news_datecreate.Value.ToString("yyyy-MM-dd").Replace(' ', 'T');
        SEO_KEYWORD.Text = getData.meta_keywords;
        SEO_TITLE.Text = getData.meta_title;
        SEO_LINK.Text = getData.link_seo;
        SEO_DEP.Value = getData.meta_description;
        SEO_IMAGE.Text = getData.meta_image;
        //if (getData.news_trangchu == true)
        //{
        //    txtTrangChu.Checked = true;
        //}
        //else
        //{
        //    txtTrangChu.Checked = false;
        //}
        //if (getData.news_trunghocphothong == true)
        //{
        //    txtTrungHocPT.Checked = true;
        //}
        //else
        //{
        //    txtTrungHocPT.Checked = false;
        //}
        //if (getData.news_trunghoccoso == true)
        //{
        //    txtTrungHocCS.Checked = true;
        //}
        //else
        //{
        //    txtTrungHocCS.Checked = false;
        //}
        //if (getData.news_tieuhoc == true)
        //{
        //    txtTrangChu.Checked = true;
        //}
        //else
        //{
        //    txtTieuHoc.Checked = false;
        //}
        //if (getData.news_mamnon == true)
        //{
        //    txtMamNon.Checked = true;
        //}
        //else
        //{
        //    txtMamNon.Checked = false;
        //}
        if (getData.news_image != null)
            image = getData.news_image;
        txtImage.Value = getData.news_image;
    }

    public bool checknull()
    {
        if (txtTieuDe.Text != "")
            return true;
        else return false;
    }
    protected void btnLuu_Click(object sender, EventArgs e)
    {

        if (Page.IsValid && FileUpload1.HasFile)
        {
            String folderUser = Server.MapPath("~/uploadimages/anh_tintuc/");
            if (!Directory.Exists(folderUser))
            {
                Directory.CreateDirectory(folderUser);
            }
            //string filename;
            string ulr = "/uploadimages/anh_tintuc/";
            HttpFileCollection hfc = Request.Files;
            string filename = Path.GetRandomFileName() + Path.GetExtension(FileUpload1.FileName);
            string fileName_save = Path.Combine(Server.MapPath("~/uploadimages/anh_tintuc"), filename);
            FileUpload1.SaveAs(fileName_save);
            image = ulr + filename;
        }
        admin_User logedMember = Session["AdminLogined"] as admin_User;
        cls_News cls = new cls_News();
        if (checknull() == false)
            alert.alert_Warning(Page, "Hãy nhập đầy đủ thông tin!", "");
        else
        {
            string KEYWORD = "", TitleSeo = "", Link = "", Dep = "", ImageSeo = "";
            {
                if (SEO_KEYWORD.Text != "")
                {
                    KEYWORD = SEO_KEYWORD.Text;
                }
                if (SEO_TITLE.Text != "")
                {
                    TitleSeo = SEO_TITLE.Text;
                }
                if (SEO_LINK.Text != "")
                {
                    Link = SEO_LINK.Text;
                }
                if (SEO_DEP.Value != "")
                {
                    Dep = SEO_DEP.Value;
                }
                if (SEO_IMAGE.Text != "")
                {
                    ImageSeo = SEO_IMAGE.Text;
                }
            }
            if (RouteData.Values["id"].ToString() == "0")
            {

                if (image == null)
                {
                    image = "/images/790x525.jpg";
                }
                else
                {
                }
                if (cls.Linq_Them(txtTieuDe.Text, image, dteNgayDang.Value, txttomtat.Text, edtnoidung.Html, Convert.ToInt32(ddlloaisanpham.Value.ToString()), KEYWORD, TitleSeo, Link, Dep, ImageSeo, true, true, true, true, true))
                    alert.alert_Success(Page, "Thêm thành công", "");
                else alert.alert_Error(Page, "Thêm thất bại", "");

            }
            else
            {
                if (image == null)
                    image = txtImage.Value;
                // Convert.ToInt32(ddlloaisanpham.Value.ToString()),
                if (cls.Linq_Sua(Convert.ToInt32(RouteData.Values["id"].ToString()), txtTieuDe.Text, image, dteNgayDang.Value, txttomtat.Text, edtnoidung.Html, KEYWORD, TitleSeo, Link, Dep, ImageSeo, true, true, true, true, true))
                    alert.alert_Success(Page, "Cập nhật thành công", "");
                else alert.alert_Error(Page, "Cập nhật thất bại", "");
            }
            Response.Redirect("/admin-news");
        }
    }

}