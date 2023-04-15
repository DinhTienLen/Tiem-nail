using DevExpress.Web.ASPxHtmlEditor;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_News : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    private int _id;
    string image;
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
        var getData = from n in db.tb_News
                      join tb in db.tb_NewsCates on n.newscate_id equals tb.newscate_id
                      orderby n.news_datecreate descending
                      select new
                      {
                          n.news_id,
                          n.news_title,
                          n.news_summary,
                          tb.newscate_title,
                          n.news_image,
                          n.news_datecreate,
                          n.news_active,
                      };
        grvList.DataSource = getData;
        grvList.DataBind();
        

    }
    
    protected void btnThem_Click(object sender, EventArgs e)
    {
        Response.Redirect("/admin-them-tin-tuc-0");
    }
    protected void btnChiTiet_Click(object sender, EventArgs e)
    {
        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "news_id" }));
        Response.Redirect("/admin-them-tin-tuc-" + _id);
    }
    protected void btnXoa_Click(object sender, EventArgs e)
    {
        cls_News cls;
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "news_id" });
        if (selectedKey.Count > 0)
        {
            foreach (var item in selectedKey)
            {
                cls = new cls_News();
                tb_New checkImage = (from i in db.tb_News where i.news_id == Convert.ToInt32(item) select i).SingleOrDefault();
                if (cls.Linq_Xoa(Convert.ToInt32(item)))
                {
                    alert.alert_Success(Page, "Xóa thành công", "");
                }
                else
                    alert.alert_Error(Page, "Xóa thất bại", "");
            }
        }
        else
            alert.alert_Warning(Page, "Bạn chưa chọn dữ liệu", "");
        loadData();
    }
}