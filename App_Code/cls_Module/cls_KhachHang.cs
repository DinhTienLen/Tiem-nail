using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for cls_MaGiamGia
/// </summary>
public class cls_KhachHang
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public cls_KhachHang()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public bool Them_KhachHang(string tenkhachhang, string gmail, string matkhau, string sodienthoai, DateTime ngaysinh)
    {
        tb_KhachHang insert = new tb_KhachHang();
        insert.khachhang_name = tenkhachhang;
        insert.khachhang_gmail = gmail;
        insert.khachhang_password = matkhau;
        insert.khachhang_sodienthoai = sodienthoai;
        insert.khachhang_ngaysinh = ngaysinh;
        insert.hidden = false;
        db.tb_KhachHangs.InsertOnSubmit(insert);
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
    public bool Sua_KhachHang(int id, string tenkhachhang, string gmail, string matkhau, string sodienthoai, DateTime ngaysinh)
    {
        tb_KhachHang update = db.tb_KhachHangs.Where(x => x.khachhang_id == id).FirstOrDefault();
        update.khachhang_name = tenkhachhang;
        update.khachhang_gmail = gmail;
        update.khachhang_password = matkhau;
        update.khachhang_sodienthoai = sodienthoai;
        update.khachhang_ngaysinh = ngaysinh;
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
    public bool Xoa_KhachHang(int id)
    {
        tb_KhachHang delete = db.tb_KhachHangs.Where(x => x.khachhang_id == id).FirstOrDefault();
        db.tb_KhachHangs.DeleteOnSubmit(delete);
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
    public bool Check_KhachHang(string phone)
    {
        var checkTaiKhoan = from tk in db.tb_KhachHangs
                            where tk.khachhang_sodienthoai == phone && tk.hidden == true
                            select tk;
        if (checkTaiKhoan.Count()> 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

}