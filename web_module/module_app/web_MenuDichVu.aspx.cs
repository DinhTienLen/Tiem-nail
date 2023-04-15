using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_app_web_MenuDichVu : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(  Request.Cookies["phone"].Value == null)
        {
            Response.Redirect("/app-login");
        }
        else
        {
            loadData();
        }
    }
    protected void loadData()
    {
        var getData = from ldv in db.tb_LoaiSanPhams
                      where ldv.sanpham_parent=="dichvu"
                      select ldv;
        rpNhomDichVu.DataSource = getData;
        rpNhomDichVu.DataBind();

    }

    protected void rpNhomDichVu_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Repeater rpDichVuItem = e.Item.FindControl("rpDichVuItem") as Repeater;
        string loaidichvu_id = DataBinder.Eval(e.Item.DataItem, "loaisanpham_id").ToString();

        var getDataDV = from d in db.tb_SanPhams
                        join l in db.tb_LoaiSanPhams on d.loaisanpham_id equals l.loaisanpham_id
                        where d.loaisanpham_id == Convert.ToInt32(loaidichvu_id)
                        select new
                        {
                            d.sanpham_name,
                            d.sanpham_giatien,
                            l.loaisanpham_id,
                            l.loaisanpham_name,

                        };
        rpDichVuItem.DataSource = getDataDV;
        rpDichVuItem.DataBind();
    }
}