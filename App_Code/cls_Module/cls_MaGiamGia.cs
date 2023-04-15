using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for cls_MaGiamGia
/// </summary>
public class cls_MaGiamGia
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected int magiamgia_soluonghiencodb;
    public cls_MaGiamGia()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public bool Them_MaGiamGia(int cate,string tenmagiamgia, int phantram, int soluong, DateTime ngaybatdau, DateTime ngayketthuc)
    {
        tb_MaGiamGia insert = new tb_MaGiamGia();
        insert.loaigiamgia_id = cate;
        insert.magiamgia_name = tenmagiamgia;
        insert.magiamgia_sogiam = phantram;
        insert.magiamgia_soluong = soluong;
        insert.magiamgia_ngaybatdau = ngaybatdau;
        insert.magiamgia_ngayketthuc = ngayketthuc;
        insert.magiamgia_hiden = false;
        //insert.magiamgia_code = "SALA"+ soluongrnd;
        insert.magiamgia_owned = false;
        db.tb_MaGiamGias.InsertOnSubmit(insert);
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
    public bool Sua_MaGiamGia(int magiamgia_id, int cate, int phantram, int soluong, DateTime ngaybatdau, DateTime ngayketthuc)
    {
        tb_MaGiamGia update = db.tb_MaGiamGias.Where(x => x.magiamgia_id == magiamgia_id).FirstOrDefault();
        update.loaigiamgia_id = cate;
        update.magiamgia_sogiam = phantram;
        update.magiamgia_soluong = soluong;
        update.magiamgia_ngaybatdau = ngaybatdau;
        update.magiamgia_ngayketthuc = ngayketthuc;
        update.magiamgia_hiden = false;
        update.magiamgia_owned = false;

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
    public bool Xoa_MaGiamGia(int magiamgia_id)
    {
        tb_MaGiamGia delete = db.tb_MaGiamGias.Where(x => x.magiamgia_id == magiamgia_id).FirstOrDefault();
        db.tb_MaGiamGias.DeleteOnSubmit(delete);
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