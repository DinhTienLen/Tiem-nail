using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_app_web_DanhGiaChiTiet : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
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

    protected void btnGui_ServerClick(object sender, EventArgs e)
    {
        if(txtLoai.Value=="")
        {
            txtLoai.Value = "Chuyên nghiệp";
        }    
        var getIDKhachHang = from kh in db.tb_KhachHangs where kh.khachhang_sodienthoai == Request.Cookies["phone"].Value select kh;
        tb_HomThuGopY insert = new tb_HomThuGopY();
        insert.homthugopy_content = txtNoiDung.Value;
        insert.homthugopy_loai = txtLoai.Value;
        insert.khachhang_id = getIDKhachHang.FirstOrDefault().khachhang_id;
        db.tb_HomThuGopies.InsertOnSubmit(insert);
        db.SubmitChanges();
        alert.alert_Success(Page, "Đã gửi góp ý tới SalaNails", "Chúng tôi cảm ơn Quý Khách đã tin tưởng dịch vụ");

    }
}