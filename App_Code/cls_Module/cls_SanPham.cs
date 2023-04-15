using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for cls_LoaiSanPham
/// </summary>
public class cls_SanPham
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public cls_SanPham()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public bool Them_SanPham_Parent(string tensanpham, string sanpham_image, int loai, string parent)
    {
        tb_SanPham insert = new tb_SanPham();
        insert.sanpham_name = tensanpham;
       
        insert.sanpham_image = sanpham_image;
        insert.loaisanpham_id = loai;
        insert.sanpham_parent = parent;
        db.tb_SanPhams.InsertOnSubmit(insert);
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
    public bool Them_SanPham(string tensanpham, string thongtin, int giatien, string sanpham_image, int loaisanpham)
    {
        tb_SanPham insert = new tb_SanPham();
        insert.sanpham_name = tensanpham;
        insert.sanpham_news = thongtin;
        insert.sanpham_giatien = giatien;
        insert.sanpham_image = sanpham_image;
        insert.loaisanpham_id = loaisanpham;
        db.tb_SanPhams.InsertOnSubmit(insert);
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
    public bool Them_SanPham_NailsBox(string tensanpham, int giatien, string sanpham_image, int loaisanpham)
    {
        tb_SanPham insert = new tb_SanPham();
        insert.sanpham_name = tensanpham;
        insert.sanpham_giatien = giatien;
        insert.sanpham_image = sanpham_image;
        insert.loaisanpham_id = loaisanpham;
        db.tb_SanPhams.InsertOnSubmit(insert);
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
    public bool Sua_SanPham_Parent(int sanpham_id, string tensanpham,  string sanpham_image, int loai, string parent)
    {
        tb_SanPham update = db.tb_SanPhams.Where(x => x.sanpham_id == sanpham_id).FirstOrDefault();
        // if(sanpham_image!=null)
        update.sanpham_name = tensanpham;
        update.sanpham_image = sanpham_image;
        update.loaisanpham_id = loai;
        update.sanpham_parent = parent;

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
    public bool Sua_SanPham(int sanpham_id, string tensanpham, string thongtin, int giatien, string sanpham_image, int loaisanpham)
    {
        tb_SanPham update = db.tb_SanPhams.Where(x => x.sanpham_id == sanpham_id).FirstOrDefault();
       // if(sanpham_image!=null)
        update.sanpham_name = tensanpham;
        update.sanpham_news = thongtin;
        update.sanpham_giatien = giatien;
        update.sanpham_image = sanpham_image;
        update.loaisanpham_id = loaisanpham;

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
    public bool Sua_SanPham_NailsBox(int sanpham_id, string tensanpham,  int giatien, string sanpham_image, int loaisanpham)
    {
        tb_SanPham update = db.tb_SanPhams.Where(x => x.sanpham_id == sanpham_id).FirstOrDefault();
        // if(sanpham_image!=null)
        update.sanpham_name = tensanpham;
        update.sanpham_giatien = giatien;
        update.sanpham_image = sanpham_image;
        update.loaisanpham_id = loaisanpham;

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
    public bool Xoa_SanPham(int sanpham_id)
    {
        tb_SanPham delete = db.tb_SanPhams.Where(x => x.sanpham_id == sanpham_id).FirstOrDefault();
        db.tb_SanPhams.DeleteOnSubmit(delete);

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