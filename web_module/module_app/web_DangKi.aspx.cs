using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class web_module_module_app_web_DangKi : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    cls_security md5 = new cls_security();
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnDangki_ServerClick(object sender, EventArgs e)
    {
        if (txtSoDienThoai.Value == "" || txtHoTen.Value=="")
        {
            alert.alert_Error(Page, "Vui lòng nhập đầy đủ thông tin", "");
        }
        else
        {
            var checkTaiKhoan = from tk in db.tb_KhachHangs where tk.khachhang_sodienthoai == txtSoDienThoai.Value select tk;
            if(checkTaiKhoan.Count()>0)
            {
                alert.alert_Error(Page, "Số điện thoại này đã tồn tại", "");
            }   
            else
            {
                tb_KhachHang insert = new tb_KhachHang();
                insert.khachhang_name = txtHoTen.Value;
                insert.khachhang_sodienthoai = txtSoDienThoai.Value;
                insert.khachhang_gmail = txtEmail.Value;
                //insert.khachhang_password = md5.HashCode(txtMatKhau.Value);
                insert.hidden = true;
                db.tb_KhachHangs.InsertOnSubmit(insert);
                db.SubmitChanges();
                //alert.alert_Success(Page, "Đăng kí thành công", "");
                Response.Redirect("~/app-login");
            }    
            
        }
    }
}