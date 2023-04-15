using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_app_web_ThietLapTaiKhoan : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    protected void Page_Load(object sender, EventArgs e)
    {
        //load data lên các input lần đầu tiên, các lần sau không vào hàm load
        if (Request.Cookies["phone"].Value != null)
        {
            if (!IsPostBack)
            {
                load_data();
            }
        }
        else
        {
            Response.Redirect("app-login");
        }
    }

   
    private void load_data()
    {
        string getCookieUserAccount = Request.Cookies["phone"].Value;
        tb_KhachHang KhachHang = (from kh in db.tb_KhachHangs
                                  where kh.khachhang_sodienthoai == getCookieUserAccount
                                  select kh).First();
        txt_HoTen.Value = KhachHang.khachhang_name;
        txt_Gmail.Value = KhachHang.khachhang_gmail;
        txt_DiaChi.Value = KhachHang.khachhang_diachi;
        txt_Phone.Value = KhachHang.khachhang_sodienthoai;
    }
    

    protected void btnLuu_ServerClick(object sender, EventArgs e)
    {
        string getCookiesUserAccount = Request.Cookies["phone"].Value;
        tb_KhachHang KhachHang = (from kh in db.tb_KhachHangs
                                  where kh.khachhang_sodienthoai == getCookiesUserAccount
                                  select kh).First();
        // Lưu thông tin trong các thẻ input
        KhachHang.khachhang_diachi = txt_DiaChi.Value;
        db.SubmitChanges();
        alert.alert_Success(Page, "Cập nhật thành công!", "");
        load_data();
    }

   
}