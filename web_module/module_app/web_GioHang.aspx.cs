 using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_app_web_GioHang : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    public string TienTong;
    private int tongtien;
    private float tien;

    protected void Page_Load(object sender, EventArgs e)
    {
        cls_KhachHang cls = new cls_KhachHang();
        if (cls.Check_KhachHang(Request.Cookies["phone"].Value))
        {
            if(!IsPostBack)
            loadData();
        }
        else
        {
            Response.Redirect("/app-login");
        }
    }
    protected void loadData()
    {
        var getIDKhachHang = from kh in db.tb_KhachHangs where kh.khachhang_sodienthoai == Request.Cookies["phone"].Value select kh;
        var getDataDatLich = from hdt in db.tb_HoaDons
                             join hdctt in db.tb_HoaDonChiTiets on hdt.hoadon_id equals hdctt.hoadon_id
                             join sp in db.tb_SanPhams on hdctt.sanpham_id equals sp.sanpham_id
                             where hdt.khachhang_id == getIDKhachHang.FirstOrDefault().khachhang_id
                             && hdt.hoadon_hidden == "Tạo giỏ hàng" && hdt.hoadontam_LoaiThanhToan == "Giỏ hàng" && hdt.hoadon_tinhtrang=="Order"
                             select new
                             {
                                 sp.sanpham_name,
                                 sp.sanpham_id,
                                 sp.sanpham_new,
                                 hdctt.hoadonchitiet_dongia,
                                 hdctt.hoadonchitiet_id,
                                 hdctt.hoadonchitiet_soluong,
                                 thanhtien = hdctt.hoadonchitiet_soluong * hdctt.hoadonchitiet_dongia,
                                 sp.sanpham_image
                             };
        if(getDataDatLich.Count()>0)
        {
            block_chuyenkhoan.Visible = true;
        }
        else
        {
            block_chuyenkhoan.Visible = false;
        }
        rpNails.DataSource = getDataDatLich;
        rpNails.DataBind();
        tongtien = Convert.ToInt32(getDataDatLich.Sum(x => x.thanhtien));
        tb_HoaDon update = (from hd in db.tb_HoaDons
                            where hd.khachhang_id == getIDKhachHang.FirstOrDefault().khachhang_id && hd.hoadon_tinhtrang == "Order" && hd.hoadontam_LoaiThanhToan == "Giỏ hàng"
                            orderby hd.hoadon_id descending
                            select hd).FirstOrDefault();
        if (update != null)
        {
            update.hoadon_tongtien = tongtien;
            update.hoadon_sodienthoaikhachhang = getIDKhachHang.FirstOrDefault().khachhang_sodienthoai;
            db.SubmitChanges();
            //update.hoadon_diachigiaohang = txtDiaChi.Value;
        }
        if (Session["vourcher_giohang"] != null)
        {
             
                               lblVourcher.Text = Session["vourcher"].ToString();
            var checkMaVach = (from mv in db.tb_MaGiamGiaCuaKhachHangs
                               join m in db.tb_MaGiamGias on mv.magiamgia_id equals m.magiamgia_id
                               where mv.khachhang_id == getIDKhachHang.FirstOrDefault().khachhang_id
                               && mv.magiamgiacuakhachhang_id == Convert.ToInt32(lblVourcher.Text)
                               select m).FirstOrDefault();
            lblPercent.Text = checkMaVach.magiamgia_sogiam + "";
            if (checkMaVach != null)
            {
                float pt = float.Parse(checkMaVach.magiamgia_sogiam.ToString()) / 100;
                tien = tongtien * (1 - pt);
                update.hoadon_tongtien = tien;
                update.hoadon_magiamgia = checkMaVach.magiamgia_sogiam;
                db.SubmitChanges();
                TienTong = tien.ToString();
                TienTong = String.Format("{0:#,0.##} {1}", Convert.ToDouble(TienTong.ToString()), "đ");
            }
            else
            {
                alert.alert_Error(Page, "Mã giảm giá không đúng", "");
            }
        }
        else
        {
            TienTong = String.Format("{0:#,0.##} {1}", Convert.ToDouble(tongtien.ToString()), "đ");
        }
    }
    protected void btnXoaSanPham_ServerClick(object sender, EventArgs e)
    {
        var getIDKhachHang = from kh in db.tb_KhachHangs where kh.khachhang_sodienthoai == Request.Cookies["phone"].Value select kh;
        var XoaId = (
                     from hdctt in db.tb_HoaDonChiTiets where hdctt.hoadonchitiet_id == Convert.ToInt32(txtIDChiTiet.Value)
                     orderby hdctt.hoadonchitiet_id
                     select hdctt).FirstOrDefault();
        db.tb_HoaDonChiTiets.DeleteOnSubmit(XoaId);
        db.SubmitChanges();
        loadData();
    }
    protected void btnMaVach_ServerClick(object sender, EventArgs e)
    {
        var getIDKhachHang = from kh in db.tb_KhachHangs where kh.khachhang_sodienthoai == Request.Cookies["phone"].Value select kh;
        var checkMaVach = (from mv in db.tb_MaGiamGiaCuaKhachHangs
                           join m in db.tb_MaGiamGias on mv.magiamgia_id equals m.magiamgia_id
                           where mv.khachhang_id == getIDKhachHang.FirstOrDefault().khachhang_id
                           && mv.magiamgiacuakhachhang_id == Convert.ToInt32(lblVourcher.Text)
                           select m).FirstOrDefault();
        if (checkMaVach != null)
        {
            float pt = float.Parse(checkMaVach.magiamgia_sogiam.ToString()) / 100;
            tien = tongtien * (1 - pt);
            TienTong = tien.ToString();
            TienTong = String.Format("{0:#,0.##} {1}", Convert.ToDouble(TienTong.ToString()), "đ");
        }
        else
        {
            alert.alert_Error(Page, "Mã vạch không đúng", "");
        }
    }
    protected void btnBookLich_ServerClick(object sender, EventArgs e)
    {
      
            var getIDKhachHang = from kh in db.tb_KhachHangs where kh.khachhang_sodienthoai == Request.Cookies["phone"].Value select kh;
            tb_HoaDon updateTinhTrang = (from hdt in db.tb_HoaDons
                                         where hdt.khachhang_id == getIDKhachHang.FirstOrDefault().khachhang_id
                                           && hdt.hoadon_tinhtrang == "Order" && hdt.hoadontam_LoaiThanhToan == "Giỏ hàng"
                                           orderby hdt.hoadon_id descending
                                         select hdt).FirstOrDefault();
        if (updateTinhTrang.hoadon_imageThanhToan != null)
        {
            //updateTinhTrang.hoadon_createdate = Convert.ToDateTime(txtNgay.Value);
            //updateTinhTrang.hoadon_giovao = txtThoiGian.Value;
            //updateTinhTrang.hoadon_soluongkhachhang = Convert.ToInt32(txtSoLuongKhachHang.Value);
            updateTinhTrang.hoadon_tinhtrang = "Chờ xác nhận";
            updateTinhTrang.hoadon_tongtien = tien;
            db.SubmitChanges();
            alert.alert_Success(Page, "Sala Beauty sẽ liên hệ lại Quý khách sớm nhất", "");
            SendMail();
            if(Session["vourcher_giohang"]!=null)
            {
                Session["vourcher_giohang"] = null;
            }    
            loadData();
        }
        else
        {
            alert.alert_Error(Page, "Vui lòng chuyển khoản trước khi đặt hàng", "");
        }    
       

    }
    protected void btnCapNhatGiaTien_ServerClick(object sender, EventArgs e)
    {
        var getIDKhachHang = from kh in db.tb_KhachHangs where kh.khachhang_sodienthoai == Request.Cookies["phone"].Value select kh;
        tb_HoaDonChiTiet updateSoLuong = (from hdctt in db.tb_HoaDonChiTiets
                                          where hdctt.hoadonchitiet_id == Convert.ToInt32(txthdctid.Value)
                                          select hdctt).SingleOrDefault();
        updateSoLuong.hoadonchitiet_soluong = Convert.ToInt16(txtSoLuongSanPham.Value);
        db.SubmitChanges();
        loadData();
    }
    private bool SendMail()
    {
        try
        {
            var fromAddress = "tinnhankhachhang@gmail.com";//  tinnhankhachhang@gmail.com
                                                           // pass : abc123#!
            var toAddress = "phungduc1989@gmail.com,hoanglan6192@gmail.com,sala.nails.beauty@gmail.com"; // 
            const string fromPassword = "jcstiaveptusqrxm";//Password of your Email address 
                                                           //var fromAddress = "phungduc1989@gmail.com";
                                                           //var toAddress = email;
                                                           //const string fromPassword = "jhkleocbcdnhdcea";
            string subject, title;
            title = "Có Thông tin đặt hàng nails box của khách hàng salabeauty";
            subject = "<!DOCTYPE html><html><head><title></title></head><body ><div>" +
            "<h3 style=\"margin-top:0px; text-align:center; color:#029ada\">Khách hàng Order: <a href='http://salanails.com/admin-hoa-don-thanh-toan'>tại đây.</a></h3>" +
            "</div></body></html>";
            var smtp = new System.Net.Mail.SmtpClient();
            {
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                smtp.Timeout = 20000;
            }
            MailMessage mm = new MailMessage();
            mm.From = new MailAddress(fromAddress, "salabeauty");
            mm.Subject = title;
            mm.To.Add(toAddress);
            mm.IsBodyHtml = true;
            mm.Body = subject;
            smtp.Send(mm);
            return true;
        }
        catch
        {
            return false;
        }
    }
}