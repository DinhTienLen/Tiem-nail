using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_app_web_ThongTinChiNhanhChiTiet : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert al = new cls_Alert();
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(RouteData.Values["chinhanh-id"]);
        //al.alert_Error(Page,"Leen rooif"+id,"");
        var getData = from cn in db.tb_ThongTinChiNhanhs
                      where cn.thongtinchinhanh_id == id
                      select new
                      {
                          cn.thongtinchinhanh_gioithieu,
                          cn.thongtinchinhanh_name
                      };
        rpTTGioiThieuChiNhanh.DataSource = getData;
        rpTTGioiThieuChiNhanh.DataBind();

    }
}