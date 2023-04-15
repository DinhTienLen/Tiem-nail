using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for cls_LoaiMaGiamGia
/// </summary>
public class cls_LoaiMaGiamGia
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public cls_LoaiMaGiamGia()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public bool Them_LoaiMaGiamGia(string tenloai)
    {
        tb_LoaiMaGiamGia insert = new tb_LoaiMaGiamGia();
        insert.loaimagiamgia_name = tenloai;
        db.tb_LoaiMaGiamGias.InsertOnSubmit(insert);
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
    public bool Sua_LoaiMaGiamGia(int loai_id, string tenloai)
    {
        tb_LoaiMaGiamGia update = db.tb_LoaiMaGiamGias.Where(x => x.loaimagiamgia_id == loai_id).FirstOrDefault();
        update.loaimagiamgia_name = tenloai;
        
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
    public bool Xoa_LoaiMaGiamGia(int loai_id)
    {
        tb_LoaiMaGiamGia delete = db.tb_LoaiMaGiamGias.Where(x => x.loaimagiamgia_id == loai_id).FirstOrDefault();
        db.tb_LoaiMaGiamGias.DeleteOnSubmit(delete);

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