using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for cls_LoaiSanPham
/// </summary>
public class cls_ThongTinChiNhanhImage
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public cls_ThongTinChiNhanhImage()
    {
        //
        // TODO: Add constructor logic here
        //
    }
  
    public bool Them_Image(int chinhanh_id, string chinhanhimage_image)
    {
        tb_ThongTinChiNhanhImage insert = new tb_ThongTinChiNhanhImage();
        insert.thongtinchinhanhimage_image = chinhanhimage_image;
        insert.thongtinchinhanh_id = chinhanh_id;
        db.tb_ThongTinChiNhanhImages.InsertOnSubmit(insert);
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