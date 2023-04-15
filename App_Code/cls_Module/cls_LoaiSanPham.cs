using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for cls_LoaiSanPham
/// </summary>
public class cls_LoaiSanPham
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public cls_LoaiSanPham()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public bool Them_LoaiSanPham(string tenloai,string image, string parent)
    {
        tb_LoaiSanPham insert = new tb_LoaiSanPham();
       
        insert.loaisanpham_name = tenloai;
        insert.loaisanpham_image = image;
        insert.sanpham_parent = parent;
        db.tb_LoaiSanPhams.InsertOnSubmit(insert);
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
    public bool Sua_LoaiSanPham(int loai_id, string tenloai, string image)
    {
        tb_LoaiSanPham update = db.tb_LoaiSanPhams.Where(x => x.loaisanpham_id == loai_id).FirstOrDefault();
        update.loaisanpham_name = tenloai;
        update.loaisanpham_image = image;
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
    public bool Xoa_LoaiSanPham(int loai_id)
    {
        tb_LoaiSanPham delete = db.tb_LoaiSanPhams.Where(x => x.loaisanpham_id == loai_id).FirstOrDefault();
        db.tb_LoaiSanPhams.DeleteOnSubmit(delete);

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