using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_app_web_ThongTinDichVuChiTiet : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    //cls_Alert alert = new cls_Alert();
    private int _id;
    protected void Page_Load(object sender, EventArgs e)
    {
        cls_KhachHang cls = new cls_KhachHang();
        if (cls.Check_KhachHang(Request.Cookies["phone"].Value))
        {
            _id = Convert.ToInt32(RouteData.Values["id"]);
            var getData = from dv in db.tb_News
                          where dv.news_id == _id
                          select dv;

            rpNewsDetail.DataSource = getData;
            rpNewsDetail.DataBind();
        }
        else
        {
            Response.Redirect("/app-login");
        }
      
    }
}