using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for cls_LoaiSanPham
/// </summary>
public class cls_ThongTinChiNhanh
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public cls_ThongTinChiNhanh()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public bool Them_ThongTinChiNhanh(string tenchinhanh, string diachichinhanh, string chinhanh_image, string sodienthoai, string gioithieu)
    {
        tb_ThongTinChiNhanh insert = new tb_ThongTinChiNhanh();
        insert.thongtinchinhanh_name = tenchinhanh;
        insert.thongtinchinhanh_image = chinhanh_image;
        insert.thongtinchinhanh_diachi = diachichinhanh;
        insert.thongtinchinhanh_sodiemthoai = sodienthoai;
        insert.thongtinchinhanh_gioithieu = gioithieu;
        db.tb_ThongTinChiNhanhs.InsertOnSubmit(insert);
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
    public bool Sua_ThongTinChiNhanh(int chinhanh_id, string tenchinhanh, string diachichinhanh, string chinhanh_image, string sodienthoai, string gioithieu)
    {
        tb_ThongTinChiNhanh update = db.tb_ThongTinChiNhanhs.Where(x => x.thongtinchinhanh_id == chinhanh_id).FirstOrDefault();
        // if(sanpham_image!=null)
        update.thongtinchinhanh_name = tenchinhanh;
        update.thongtinchinhanh_image = chinhanh_image;
        update.thongtinchinhanh_diachi = diachichinhanh;
        update.thongtinchinhanh_sodiemthoai = sodienthoai;
        update.thongtinchinhanh_gioithieu = gioithieu;
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

    public bool Xoa_ThongTinChiNhanh(int chinhanh_id)
    {
        tb_ThongTinChiNhanh delete = db.tb_ThongTinChiNhanhs.Where(x => x.thongtinchinhanh_id == chinhanh_id).FirstOrDefault();
        db.tb_ThongTinChiNhanhs.DeleteOnSubmit(delete);

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