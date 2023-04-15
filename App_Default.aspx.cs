using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class App_Defaul : System.Web.UI.Page
{
    //dbcsdlDataContext db = new dbcsdlDataContext();
    //protected void Page_Load(object sender, EventArgs e)
    //{
    //    cls_KhachHang cls = new cls_KhachHang();
    //    if(cls.Check_KhachHang(Request.Cookies["phone"].Value))
    //    {
    //        var getkh = (from kh in db.tb_KhachHangs
    //                     where kh.khachhang_sodienthoai == Request.Cookies["phone"].Value
    //                     select kh).FirstOrDefault();
    //        rpThongBao.DataSource = (from tb in db.tbThongBaoTuQuanTris where tb.khachhang_id == getkh.khachhang_id orderby tb.thongbao_id descending select tb).Take(10);
    //        rpThongBao.DataBind();
    //    }   
    //    else
    //    {
    //        Response.Redirect("/app-login");
    //    }    
    //}
}