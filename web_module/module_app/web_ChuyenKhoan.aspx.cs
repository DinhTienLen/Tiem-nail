using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_app_web_ChuyenKhoan : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    public string TienTong;
    string image;
    private int tongtien;
    private float tien;
    public string MaHoaDon;
    protected void Page_Load(object sender, EventArgs e)
    {
        cls_KhachHang cls = new cls_KhachHang();
        if (cls.Check_KhachHang(Request.Cookies["phone"].Value))
        {
            getData();
        }
        else
        {
            Response.Redirect("/app-login");
        }

    }
    protected void getData()
    {
        var getIDKhachHang = from kh in db.tb_KhachHangs where kh.khachhang_sodienthoai == Request.Cookies["phone"].Value select kh;
        var getDataDatLich = from hdt in db.tb_HoaDons
                             where hdt.khachhang_id == getIDKhachHang.FirstOrDefault().khachhang_id
                             && hdt.hoadon_hidden == "Tạo giỏ hàng" && hdt.hoadontam_LoaiThanhToan == "Giỏ hàng" && hdt.hoadon_tinhtrang == "Order"
                             select new
                             {
                                hdt.hoadon_code,
                                hdt.hoadon_tongtien
                             };
        //rpListDatLich.DataSource = getDataDatLich;
        //rpListDatLich.DataBind();
        MaHoaDon = getDataDatLich.FirstOrDefault().hoadon_code;
        TienTong = String.Format("{0:#,0.##} {1}", Convert.ToDouble(getDataDatLich.FirstOrDefault().hoadon_tongtien.ToString()), "đ");
    }

    protected void btnLuu_ServerClick(object sender, EventArgs e)
    {
        if (Page.IsValid && FileUpload1.HasFile)
        {
            String folderUser = Server.MapPath("~/uploadimages/image_ThanhToanGioHang/");
            if (!Directory.Exists(folderUser))
            {
                Directory.CreateDirectory(folderUser);
            }
            //string filename;
            string ulr = "/uploadimages/image_ThanhToanGioHang/";
            HttpFileCollection hfc = Request.Files;
            string filename = Path.GetRandomFileName() + Path.GetExtension(FileUpload1.FileName);
            string fileName_save = Path.Combine(Server.MapPath("~/uploadimages/image_ThanhToanGioHang"), filename);
            FileUpload1.SaveAs(fileName_save);
            image = ulr + filename;
            var getIDKhachHang = from kh in db.tb_KhachHangs where kh.khachhang_sodienthoai == Request.Cookies["phone"].Value select kh;
            tb_HoaDon update = (from hdt in db.tb_HoaDons
                                where hdt.khachhang_id == getIDKhachHang.FirstOrDefault().khachhang_id
                                && hdt.hoadon_hidden == "Tạo giỏ hàng" && hdt.hoadontam_LoaiThanhToan == "Giỏ hàng" && hdt.hoadon_tinhtrang == "Order"
                                orderby hdt.hoadon_id descending
                                select hdt).FirstOrDefault();
            update.hoadon_imageThanhToan = image;
            db.SubmitChanges();
            Response.Redirect("/gio-hang");
        }
    }
}