using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for cls_LoaiSanPham
/// </summary>
public class cls_Slide
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public cls_Slide()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public bool Them_Slide( string slide_image)
    {
        tb_Slide insert = new tb_Slide();
        insert.slide_image = slide_image;
        db.tb_Slides.InsertOnSubmit(insert);
        try
        {
            db.SubmitChanges();
            return true;

        }
        catch
        {
            return false;
        }

    }
    public bool Sua_Slide(int slide_id, string slide_image)
    {
        tb_Slide update = db.tb_Slides.Where(x => x.slide_id == slide_id).FirstOrDefault();
        // if(sanpham_image!=null)
        update.slide_image = slide_image;
        try
        {
            db.SubmitChanges();
            return true;
        }
        catch
        {
            return false;
        }
    }

    public bool Xoa_Slide(int slide_id)
    {
        tb_Slide delete = db.tb_Slides.Where(x => x.slide_id == slide_id).FirstOrDefault();
        db.tb_Slides.DeleteOnSubmit(delete);

        try
        {
            db.SubmitChanges();
            return true;
        }
        catch
        {
            return false;
        }
    }

}