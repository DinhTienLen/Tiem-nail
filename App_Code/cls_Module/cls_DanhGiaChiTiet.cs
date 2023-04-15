using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for cls_LoaiDanhGiaChiTiet
/// </summary>
public class cls_DanhGiaChiTiet
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public cls_DanhGiaChiTiet()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public bool Them_DanhGiaChiTiet(int diem, string noidung,  string image)
    {
        tb_DanhGiaChiTiet insert = new tb_DanhGiaChiTiet();
        
        insert.danhgiachitiet_binhchon = diem.ToString();
        insert.danhgiachitiet_noidung = noidung;
        insert.danhgiachitiet_image = image;
      
        db.tb_DanhGiaChiTiets.InsertOnSubmit(insert);
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
    public bool Sua_DanhGiaChiTiet(int danhgiachitiet_id, int diem, string noidung, string image)
    {
        tb_DanhGiaChiTiet update = db.tb_DanhGiaChiTiets.Where(x => x.danhgiachitiet_id == danhgiachitiet_id).FirstOrDefault();
        update.danhgiachitiet_binhchon = diem.ToString();
        update.danhgiachitiet_noidung = noidung;
        update.danhgiachitiet_image = image;
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

    public bool Xoa_DanhGiaChiTiet(int danhgiachitiet_id)
    {
        tb_DanhGiaChiTiet delete = db.tb_DanhGiaChiTiets.Where(x => x.danhgiachitiet_id == danhgiachitiet_id).FirstOrDefault();
        db.tb_DanhGiaChiTiets.DeleteOnSubmit(delete);

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