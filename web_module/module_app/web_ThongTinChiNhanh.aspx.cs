using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_app_web_ThongTinChiNhanh : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        var getData = from cn in db.tb_ThongTinChiNhanhs
                      select new
                      {
                          cn.thongtinchinhanh_id,
                          cn.thongtinchinhanh_name,
                          cn.thongtinchinhanh_diachi,
                          cn.thongtinchinhanh_sodiemthoai,
                          cn.thongtinchinhanh_image
                      };
        // đẩy dữ liệu vào
        rpTTChiNhanh.DataSource = getData;
        rpTTChiNhanh.DataBind();

    }
}