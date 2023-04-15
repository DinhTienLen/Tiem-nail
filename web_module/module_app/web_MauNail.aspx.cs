using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_app_web_MauNailBox : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    

    protected void Page_Load(object sender, EventArgs e)
    {
        load_Slide();
        load_MauNail();
    }
    private void load_Slide()
    {
        var getData = (from s in db.tb_SanPhams
                      orderby s.sanpham_id descending
                      select s).Take(10);
        rpSlide.DataSource = getData;
        rpSlide.DataBind();
    }
    private void load_MauNail()
    {
        var getData = from lnb in db.tb_LoaiSanPhams
                      where lnb.sanpham_parent == "albummaunails"
                      select new
                      {
                          lnb.loaisanpham_name,
                          lnb.loaisanpham_image,
                        //  lnb.solu,
                          lnb.loaisanpham_id
                      };
        rpMauNail.DataSource = getData;
        rpMauNail.DataBind();

        
    }



    //protected void btnLuotxem_ServerClick(object sender, EventArgs e)
    //{
    //    int _id = Convert.ToInt32(txtIDLoaiNailBox.Value);
    //    tb_LoaiNailBox update = db.tb_LoaiNailBoxes.Where(x => x.loainailbox_id == _id).FirstOrDefault();
    //    update.loainailbox_soluotxem = update.loainailbox_soluotxem + 1;
    //    try
    //    {
    //        db.SubmitChanges();
    //    }
    //    catch
    //    {

    //    }

    //}
}
