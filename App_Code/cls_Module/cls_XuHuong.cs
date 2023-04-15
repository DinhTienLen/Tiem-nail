using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for cls_LoaiSanPham
/// </summary>
public class cls_XuHuong
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public cls_XuHuong()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    //public bool Them_XuHuong(string tenxuhuong, string xuhuong_image,string ngaythem,int luotxem)
    //{
    //    tb_XuHuong insert = new tb_XuHuong();
    //    insert.xuhuong_name = tenxuhuong;
    //    insert.xuhuong_anhdaidien = xuhuong_image;
    //    insert.xuhuong_ngaythem = Convert.ToDateTime(ngaythem);
    //    insert.xuhuong_soluotxem = luotxem;
    //    db.tb_XuHuongs.InsertOnSubmit(insert);
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
    //public bool Sua_XuHuong(int xuhuong_id, string tenxuhuong, string xuhuong_image)
    //{
    //    tb_XuHuong update = db.tb_XuHuongs.Where(x => x.xuhuong_id == xuhuong_id).FirstOrDefault();
    //    // if(sanpham_image!=null)
    //    update.xuhuong_name = tenxuhuong;
    //    update.xuhuong_anhdaidien = xuhuong_image;
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

    //public bool Xoa_XuHuong(int xuhuong_id)
    //{
    //    tb_XuHuong delete = db.tb_XuHuongs.Where(x => x.xuhuong_id == xuhuong_id).FirstOrDefault();
    //    db.tb_XuHuongs.DeleteOnSubmit(delete);

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