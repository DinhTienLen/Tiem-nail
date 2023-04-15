using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for cls_LoaiSanPham
/// </summary>
public class cls_XuHuongImage
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public cls_XuHuongImage()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    //public bool Them_Image(int xuhuong_id,string xuhuongimage_image)
    //{
    //    tb_XuHuongImage insert = new tb_XuHuongImage();
    //    insert.xuhuongimage_image = xuhuongimage_image;
    //    insert.xuhuong_id = xuhuong_id;
    //    db.tb_XuHuongImages.InsertOnSubmit(insert);
    //    try
    //    {
    //        db.SubmitChanges();
    //        return true;
    //    }
    //    catch
    //    {
    //        return false;
    //    }

    //}
}