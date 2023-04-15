using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_app_web_MauNailBox : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    private int _id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["phone"].Value != null)
        {
            loadData();
        }
        else
        {
            Response.Redirect("web_Login.aspx");
        }
   
    }

    protected void loadData()
    {
        var getKH = (from kh in db.tb_KhachHangs
                     where kh.khachhang_sodienthoai == Request.Cookies["phone"].Value
                     select kh).FirstOrDefault();
       // _id = Convert.ToInt32(RouteData.Values["loainailbox-id"]);
        var getData = (from n in db.tb_SanPhams
                       where n.loaisanpham_id==41
                       orderby n.sanpham_id descending
                       select new
                       {
                           n.sanpham_id,
                           n.sanpham_name,
                           n.sanpham_giatien,
                           n.sanpham_image,
                           n.sanpham_luotmua,
                           giohang = (from gh in db.tb_HoaDons
                                      join hdct in db.tb_HoaDonChiTiets on gh.hoadon_id equals hdct.hoadon_id
                                      where gh.khachhang_id == Convert.ToInt32(getKH.khachhang_id)
                                      && hdct.sanpham_id == n.sanpham_id
                                      select gh).Count() > 0 ? "Đã thêm" : "Thêm"
                       });
        var getNew = getData.Take(5);
        var getOld = getData.Skip(5);
        rpNailBoxNew.DataSource = getNew;
        rpNailBoxNew.DataBind();
        rpNailBox.DataSource = getOld;
        rpNailBox.DataBind();
    }

    protected void btnGiohang_ServerClick(object sender, EventArgs e)
    {
       
        var checkSanPham = from sp in db.tb_SanPhams where sp.sanpham_id == Convert.ToInt32(txtIDNailbox.Value) select sp;
        var getIDKhachHang = from kh in db.tb_KhachHangs where kh.khachhang_sodienthoai == Request.Cookies["phone"].Value select kh;
        // Kiểm tra khách hàng có tạo đặt lịch trong bảng tạm chưa
        var checkTaoLichTam = from dht in db.tb_HoaDons where dht.hoadon_hidden == "Tạo giỏ hàng" && dht.hoadon_tinhtrang=="Order" && dht.khachhang_id == getIDKhachHang.FirstOrDefault().khachhang_id select dht;
        if (checkTaoLichTam.Count() > 0)
        {
            // Kiểm tra sản phẩm đã có trong bảng tạm chưa
            var checkSanPhamTam = from sp in db.tb_HoaDonChiTiets
                                  join hdt in db.tb_HoaDons on sp.hoadon_id equals hdt.hoadon_id
                                  where sp.sanpham_id == Convert.ToInt32(txtIDNailbox.Value) && hdt.hoadon_hidden == "Tạo giỏ hàng" && hdt.khachhang_id == getIDKhachHang.FirstOrDefault().khachhang_id
                                  select sp;
            if (checkSanPhamTam.Count() > 0)
            {
                alert.alert_Error(Page, " Sản phẩm này đã có trong giỏ hàng", "");
            }
            else
            {
                tb_HoaDonChiTiet insertCT = new tb_HoaDonChiTiet();
                insertCT.hoadon_id = checkTaoLichTam.FirstOrDefault().hoadon_id;
                insertCT.sanpham_id = Convert.ToInt32(txtIDNailbox.Value);
                insertCT.hoadonchitiet_dongia = checkSanPham.FirstOrDefault().sanpham_giatien;
                insertCT.hoadonchitiet_soluong = 1;
                db.tb_HoaDonChiTiets.InsertOnSubmit(insertCT);
                db.SubmitChanges();
                alert.alert_Success(Page, "Đã lưu vào giỏ hàng", "");
                loadData();
            }
        }
        else
        {
            cls_TaoBill bill = new cls_TaoBill();
            tb_HoaDon insert = new tb_HoaDon();
            insert.hoadon_code = bill.hamTuDongTang();
            insert.khachhang_id = getIDKhachHang.FirstOrDefault().khachhang_id;
            insert.hoadon_sodienthoaikhachhang = getIDKhachHang.FirstOrDefault().khachhang_sodienthoai;
            insert.hoadon_TenKhachHang = getIDKhachHang.FirstOrDefault().khachhang_name;
            insert.hoadon_createdate = DateTime.Now;
            insert.hoadon_tongtien = 0;
            insert.hoadon_hidden = "Tạo giỏ hàng";
            insert.hoadontam_LoaiThanhToan = "Giỏ hàng";
            insert.hoadon_tinhtrang = "Order";
            db.tb_HoaDons.InsertOnSubmit(insert);
            db.SubmitChanges();
            tb_HoaDonChiTiet insertCT = new tb_HoaDonChiTiet();
            insertCT.hoadon_id = insert.hoadon_id;
            insertCT.sanpham_id = Convert.ToInt32(txtIDNailbox.Value);
            insertCT.hoadonchitiet_dongia = checkSanPham.FirstOrDefault().sanpham_giatien;
            insertCT.hoadonchitiet_soluong = 1;
            db.tb_HoaDonChiTiets.InsertOnSubmit(insertCT);
            db.SubmitChanges();
            loadData();
        }
    }
}