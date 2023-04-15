using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_app_web_DanhGia : System.Web.UI.Page
{
    //dbcsdlDataContext db = new dbcsdlDataContext();
    //protected void Page_Load(object sender, EventArgs e)
    //{
    //    // Kiểm tra session login nếu khác null thì vào form xử lý
    //    if (Request.Cookies["UserName"].Value != null)
    //    {
    //        if (!IsPostBack)
    //        {
    //            Session["_id"] = 0;
    //        }
    //        loadData();
    //    }
    //    // nếu session = null thì trả về trang login
    //    else
    //    {
    //        Response.Redirect("/admin-login");

    //    }
    //}
    //private void loadData()
    //{
    //    //Mê mẫn, ân cần, tuyệt vời, chuyên nghiệp
    //    var getdata = from dgct in db.tb_DanhGiaChiTiets
    //                  join dg in db.tb_DanhGias on dgct.danhgia_id equals dg.danhgia_id
    //                  join kh in db.tb_KhachHangs on dg.khachhang_id equals kh.khachhang_id
    //                  join dv in db.tb_SanPhams on dg.dichvu_id equals dv.sanpham_id
    //                  where dgct.danhgiachitiet_hidden == false
    //                  select new
    //                  {
    //                      kh.khachhang_name,
    //                      dv.sanpham_name,
    //                      dgct.danhgiachitiet_noidung,
    //                      dgct.danhgiachitiet_image,
    //                      danhgiachitiet_binhchon = Convert.ToInt32(dgct.danhgiachitiet_binhchon) == 1 ? "Ân cần" :
    //                                                Convert.ToInt32(dgct.danhgiachitiet_binhchon) == 2 ? "Mê mẫn" :
    //                                                Convert.ToInt32(dgct.danhgiachitiet_binhchon) == 3 ? "Tuyệt vời" :
    //                                                Convert.ToInt32(dgct.danhgiachitiet_binhchon) == 4 ? "Chuyên nghiệp": "N/A",
    //                      danhgiachitiet_binhchon_image = Convert.ToInt32(dgct.danhgiachitiet_binhchon) == 1 ? "web_module/images/image_DanhGiaChiTiet/like.png" :
    //                                                      Convert.ToInt32(dgct.danhgiachitiet_binhchon) == 2 ? "web_module/images/image_DanhGiaChiTiet/meman.png" :
    //                                                      Convert.ToInt32(dgct.danhgiachitiet_binhchon) == 3 ? "web_module/images/image_DanhGiaChiTiet/sao.png" :
    //                                                      Convert.ToInt32(dgct.danhgiachitiet_binhchon) == 4 ? "web_module/images/image_DanhGiaChiTiet/tim.png" : "N/A"

    //                  };
    //    rpListDanhGia.DataSource = getdata;
    //    rpListDanhGia.DataBind();
    //}
}