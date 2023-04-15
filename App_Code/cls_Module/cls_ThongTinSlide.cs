using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for cls_LoaiSanPham
/// </summary>
public class cls_ThongTinSlide
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public cls_ThongTinSlide()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public bool Them_ThongTinSlide(string ql_slide_create, string ql_slide_img, string ql_slide_content, string ql_slide_hidden)
    {
        tb_QuanLySlide insert = new tb_QuanLySlide();
        insert.slide_create = Convert.ToDateTime(ql_slide_create);
        insert.slide_img = ql_slide_img;
        insert.slide_content = ql_slide_content;
        insert.slide_hidden = Convert.ToBoolean(ql_slide_hidden);
        db.tb_QuanLySlides.InsertOnSubmit(insert);
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
    public bool Sua_ThongTinSlide(int ql_slide_id, string ql_slide_create, string ql_slide_img, string ql_slide_content, string ql_slide_hidden)
    {
        tb_QuanLySlide update = db.tb_QuanLySlides.Where(x => x.slide_id == ql_slide_id).FirstOrDefault();
        // if(sanpham_image!=null)
        update.slide_create = Convert.ToDateTime(ql_slide_create);
        update.slide_img = ql_slide_img;
        update.slide_content = ql_slide_content;
        update.slide_hidden = Convert.ToBoolean(ql_slide_hidden);
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

    public bool Xoa_ThongTinSlide(int ql_slide_id)
    {
        tb_QuanLySlide delete = db.tb_QuanLySlides.Where(x => x.slide_id == ql_slide_id).FirstOrDefault();
        db.tb_QuanLySlides.DeleteOnSubmit(delete);

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