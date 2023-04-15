using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


/// <summary>
/// Summary description for cls_LoaiSanPham
/// </summary>
public class cls_TaoBill
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    public cls_TaoBill()
    {
        //
        // TODO: Add constructor logic here
        //
    }
   public bool tao_Bill( int idsanpham, string phone)
    {
        var checkSanPham = from sp in db.tb_SanPhams where sp.sanpham_id == idsanpham select sp;
        var getIDKhachHang = from kh in db.tb_KhachHangs where kh.khachhang_sodienthoai == phone select kh;
        // Kiểm tra khách hàng có tạo đặt lịch trong bảng tạm chưa
        var checkTaoLichTam = from dht in db.tb_HoaDons where dht.hoadon_hidden == "Tạo đặt lịch" && dht.hoadon_tinhtrang=="Order" && dht.khachhang_id == getIDKhachHang.FirstOrDefault().khachhang_id select dht;
        if (checkTaoLichTam.Count() > 0)
        {
            // Kiểm tra sản phẩm đã có trong bảng tạm chưa
            var checkSanPhamTam = from sp in db.tb_HoaDonChiTiets
                                  join hdt in db.tb_HoaDons on sp.hoadon_id equals hdt.hoadon_id
                                  where sp.sanpham_id == idsanpham && hdt.hoadon_hidden == "Tạo đặt lịch" && hdt.hoadon_tinhtrang=="Order" && hdt.khachhang_id == getIDKhachHang.FirstOrDefault().khachhang_id
                                  select sp;
            if (checkSanPhamTam.Count() > 0)
            {
                return false;
                //alert.alert_Error(this., "Dịch vụ này đã có trong đặt lịch", "");
            }
            else
            {
                tb_HoaDonChiTiet insertCT = new tb_HoaDonChiTiet();
                insertCT.hoadon_id = checkTaoLichTam.FirstOrDefault().hoadon_id;
                insertCT.sanpham_id = idsanpham;
                insertCT.hoadonchitiet_dongia = checkSanPham.FirstOrDefault().sanpham_giatien;
                insertCT.hoadonchitiet_soluong = 1;
                insertCT.hoadonchitiet_thanhtien = insertCT.hoadonchitiet_dongia * insertCT.hoadonchitiet_soluong;
                db.tb_HoaDonChiTiets.InsertOnSubmit(insertCT);
                db.SubmitChanges();
                return true;
                //alert.alert_Success(Page, "Đã lưu vào đặt lịch", "");
            }
        }
        else
        {
            tb_HoaDon insert = new tb_HoaDon();
            insert.hoadon_code = hamTuDongTang();
            insert.khachhang_id = getIDKhachHang.FirstOrDefault().khachhang_id;
            insert.hoadon_sodienthoaikhachhang = getIDKhachHang.FirstOrDefault().khachhang_sodienthoai;
            insert.hoadon_TenKhachHang = getIDKhachHang.FirstOrDefault().khachhang_name;
            insert.hoadon_hidden = "Tạo đặt lịch";
            insert.hoadontam_LoaiThanhToan = "Đặt lịch";
            insert.hoadon_tinhtrang = "Order";
            db.tb_HoaDons.InsertOnSubmit(insert);
            db.SubmitChanges();
            tb_HoaDonChiTiet insertCT = new tb_HoaDonChiTiet();
            insertCT.hoadon_id = insert.hoadon_id;
            insertCT.sanpham_id = idsanpham;
            insertCT.hoadonchitiet_dongia = checkSanPham.FirstOrDefault().sanpham_giatien;
            insertCT.hoadonchitiet_soluong = 1;
            insertCT.hoadonchitiet_thanhtien = insertCT.hoadonchitiet_dongia * insertCT.hoadonchitiet_soluong;
            db.tb_HoaDonChiTiets.InsertOnSubmit(insertCT);
            db.SubmitChanges();
            return true;
        }
    }
    public string hamTuDongTang()
    {
        string nam = DateTime.Now.Year + "";
        var getMaHoaDon = from hd in db.tb_HoaDons
                          orderby hd.hoadon_code descending
                          where hd.hoadon_code.Contains(nam)
                          select hd;
        if (getMaHoaDon.Count() > 0)
        {
            string s;
            int k = 0;
            s = "HD";
            k = Convert.ToInt32(getMaHoaDon.FirstOrDefault().hoadon_code.ToString().Substring(6, 4));
            k = k + 1;
            if (k < 10)
                s = s + "000";
            else if (k < 100)
                s = s + "00";
            else if (k < 1000)
                s = s + "0";
            s = nam + s + k.ToString();
           return s;
        }
        else
        {
            return nam + "HD0001";
        }

    }

}