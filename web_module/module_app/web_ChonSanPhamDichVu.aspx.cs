using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_app_web_ChonSanPham : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    string image;
    // Sản phẩm tự chọn
    int sanphamtuchon = 144;
    protected void Page_Load(object sender, EventArgs e)
    {
        cls_KhachHang cls = new cls_KhachHang();
        if (cls.Check_KhachHang(Request.Cookies["phone"].Value))
        {
            
        }
        else
        {
            Response.Redirect("/app-login");
        }
    }
    protected void btnDatLich_Click(object sender, EventArgs e)
    {
        if (Page.IsValid && FileUpload1.HasFile)
        {
            String folderUser = Server.MapPath("~/uploadimages/image_yeucaukhachhang/");
            if (!Directory.Exists(folderUser))
            {
                Directory.CreateDirectory(folderUser);
            }
            //string filename;
            string ulr = "/uploadimages/image_yeucaukhachhang/";
            HttpFileCollection hfc = Request.Files;
            string filename = Path.GetRandomFileName() + Path.GetExtension(FileUpload1.FileName);
            string fileName_save = Path.Combine(Server.MapPath("~/uploadimages/image_yeucaukhachhang"), filename);
            FileUpload1.SaveAs(fileName_save);
            image = ulr + filename;
            var checkSanPham = from sp in db.tb_SanPhams where sp.sanpham_id == sanphamtuchon select sp;
            var getIDKhachHang = from kh in db.tb_KhachHangs where kh.khachhang_sodienthoai == Request.Cookies["phone"].Value select kh;
            // Kiểm tra khách hàng có tạo đặt lịch trong bảng tạm chưa
            var checkTaoLichTam = from dht in db.tb_HoaDons where dht.hoadon_hidden == "Tạo đặt lịch" && dht.khachhang_id == getIDKhachHang.FirstOrDefault().khachhang_id select dht;
            if (checkTaoLichTam.Count() > 0)
            {
                // Kiểm tra sản phẩm đã có trong bảng tạm chưa
                var checkSanPhamTam = from sp in db.tb_HoaDonChiTiets
                                      join hdt in db.tb_HoaDons on sp.hoadon_id equals hdt.hoadon_id
                                      where sp.sanpham_id == sanphamtuchon && hdt.hoadon_hidden == "Tạo đặt lịch" && hdt.khachhang_id == getIDKhachHang.FirstOrDefault().khachhang_id
                                      select sp;
                if (checkSanPhamTam.Count() > 0)
                {
                    alert.alert_Error(Page, "Dịch vụ này đã có trong đặt lịch", "");
                }
                else
                {
                    tb_HoaDonChiTiet insertCT = new tb_HoaDonChiTiet();
                    insertCT.hoadon_id = checkTaoLichTam.FirstOrDefault().hoadon_id;
                    insertCT.sanpham_id = sanphamtuchon;
                    insertCT.hoadonchitiet_image = image;
                    insertCT.hoadonchitiettam_noidungchonmaukhachhang = txtTenMau.Value;
                    insertCT.hoadonchitiet_dongia = Convert.ToInt32(txtGiaTien.Value);
                    insertCT.hoadonchitiet_soluong = 1;
                    db.tb_HoaDonChiTiets.InsertOnSubmit(insertCT);
                    db.SubmitChanges();
                    alert.alert_Success(Page, "Đã lưu vào đặt lịch", "");
                }
            }
            else
            {
                tb_HoaDon insert = new tb_HoaDon();
                insert.khachhang_id = getIDKhachHang.FirstOrDefault().khachhang_id;
                insert.hoadon_TenKhachHang = getIDKhachHang.FirstOrDefault().khachhang_name;
                insert.hoadon_sodienthoaikhachhang = getIDKhachHang.FirstOrDefault().khachhang_sodienthoai;
                insert.hoadon_hidden = "Tạo đặt lịch";
                insert.hoadontam_LoaiThanhToan = "Đặt lịch";
                insert.hoadon_tinhtrang = "Order";
                db.tb_HoaDons.InsertOnSubmit(insert);
                db.SubmitChanges();
                tb_HoaDonChiTiet insertCT = new tb_HoaDonChiTiet();
                insertCT.hoadon_id = insert.hoadon_id;
                insertCT.sanpham_id = sanphamtuchon;
                insertCT.hoadonchitiet_dongia = checkSanPham.FirstOrDefault().sanpham_giatien;
                insertCT.hoadonchitiet_soluong = 1;
                insertCT.hoadonchitiet_image = image;
                db.tb_HoaDonChiTiets.InsertOnSubmit(insertCT);
                db.SubmitChanges();
            }

        }
    }
}