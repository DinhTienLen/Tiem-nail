using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class web_module_module_app_web_Login : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    cls_security md5 = new cls_security();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnDanhNhap_ServerClick(object sender, EventArgs e)
    {
        //string taiKhoan = txt_taikhoan.Value.Trim();
        string phone =txt_SoDienThoai.Value;
        // Bước 1 kiểm tra điều kiện kết hợp với tài khoản và pass
        var checkTaiKhoan = from kh in db.tb_KhachHangs
                            where kh.khachhang_sodienthoai == phone
                            select kh;
        if(checkTaiKhoan.Count()>0)
        {
            saveCookie();
            if (checkTaiKhoan.FirstOrDefault().hidden == true)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                alert.alert_Error(Page, "Tài khoản của Quý Khách đã bị lock vui lòng liên hệ qua số điện thoại: 0919.698.094 để mở lại!", "");
            }    
        }
        else if(txt_SoDienThoai.Value == "")
        {
            alert.alert_Error(Page, "Vui lòng nhập đầy đủ thông tin!", "");
        } 
        else
        {
            alert.alert_Error(Page, "Số điện thoại không đúng!", "");
        }    
        
    }
    // lưu tài khoản username lên cookie
    private void saveCookie()
    {
        /*tb_KhachHang getIDKH = (from kh in db.tb_KhachHangs
                                where kh.khachhang_username == txt_taikhoan.Value
                                select kh).First();*/
        Response.Cookies["phone"].Expires = DateTime.Now.AddDays(365);
        Response.Cookies["phone"].Value = txt_SoDienThoai.Value.ToString();
        //Response.Redirect("/web_Login.aspx");
    }


    
}