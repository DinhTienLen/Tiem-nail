using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for cls_LoaiSanPham
/// </summary>
public class cls_ThongTinLienHe
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public cls_ThongTinLienHe()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    //public bool Them_ThongTinLienHe(string thongtinlienhe_facebook, string thongtinlienhe_zalo, string thongtinlienhe_instargram, string thongtinlienhe_sodienthoai, string thongtinlienhe_diachi, string thongtinlienhe_image)
    //{
    //    tb_ThongTinLienHe insert = new tb_ThongTinLienHe();
    //    insert.thongtinlienhe_facebook = thongtinlienhe_facebook;
    //    insert.thongtinlienhe_zalo = thongtinlienhe_zalo;
    //    insert.thongtinlienhe_instargram = thongtinlienhe_instargram;
    //    insert.thongtinlienhe_sodienthoai = thongtinlienhe_sodienthoai;
    //    insert.thongtinlienhe_diachi = thongtinlienhe_diachi;
    //    insert.thongtinlienhe_image = thongtinlienhe_image;
    //    db.tb_ThongTinLienHes.InsertOnSubmit(insert);
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
    public bool Sua_ThongTinLienHe(int id, string thongtinlienhe_facebook, string thongtinlienhe_zalo, string thongtinlienhe_instargram, string thongtinlienhe_sodienthoai, string thongtinlienhe_diachi, string thongtinlienhe_youtube, string thongtinlienhe_gmail, string thongtinlienhe_website, string thongtinlienhe_image)
    {
        tb_ThongTinLienHe update = db.tb_ThongTinLienHes.Where(x => x.thongtinlienhe_id == id).FirstOrDefault();
        // if(sanpham_image!=null)
        update.thongtinlienhe_facebook = thongtinlienhe_facebook;
        update.thongtinlienhe_zalo = thongtinlienhe_zalo;
        update.thongtinlienhe_instargram = thongtinlienhe_instargram;
        update.thongtinlienhe_sodienthoai = thongtinlienhe_sodienthoai;
        update.thongtinlienhe_diachi = thongtinlienhe_diachi;
        update.thongtinlienhe_image = thongtinlienhe_image;
        update.thongtinlienhe_youtube = thongtinlienhe_youtube;
        update.thongtinlienhe_gmail = thongtinlienhe_gmail;
        update.thongtinlienhe_website = thongtinlienhe_website;
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

    //public bool Xoa_ThongTinLienHe(int thongtinlienhe_id)
    //{
    //    tb_ThongTinLienHe delete = db.tb_ThongTinLienHes.Where(x => x.thongtinlienhe_id == thongtinlienhe_id).FirstOrDefault();
    //    db.tb_ThongTinLienHes.DeleteOnSubmit(delete);
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