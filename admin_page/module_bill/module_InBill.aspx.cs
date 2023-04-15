using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_bill_module_InBill : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public int STT = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        var getHoaDon = from hd in db.tb_HoaDons where hd.hoadon_id == Convert.ToInt32(RouteData.Values["id"]) select hd;
        lblNgay.Text = getHoaDon.FirstOrDefault().hoadon_createdate.Value.ToString("yyyy-MM-dd").Replace(' ', 'T'); ;
        lblThoiGian.Text = getHoaDon.FirstOrDefault().hoadon_giovao;
        lblSoLuongKhachHang.Text = getHoaDon.FirstOrDefault().hoadon_soluongkhachhang + "";
        rpHoaDonChiTiet.DataSource = from hdct in db.tb_HoaDonChiTiets
                                     join sp in db.tb_SanPhams on hdct.sanpham_id equals sp.sanpham_id
                                     where hdct.hoadon_id == Convert.ToInt32(RouteData.Values["id"])
                                     select new
                                     {
                                         hdct.hoadonchitiet_id,
                                         hdct.hoadonchitiet_soluong,
                                         thanhtien = hdct.hoadonchitiet_soluong * hdct.hoadonchitiet_dongia,
                                         sp.sanpham_name

                                     };
        rpHoaDonChiTiet.DataBind();
        lblPercent.Text = getHoaDon.FirstOrDefault().hoadon_magiamgia + "";
        //lblTongTien.Text = getHoaDon.FirstOrDefault().hoadon_tongtien + "";
        lblTongTien.Text = String.Format("{0:#,0.##} {1}", Convert.ToDouble(getHoaDon.FirstOrDefault().hoadon_tongtien), "đ");
        lblTongTienPhaiTra.Text = String.Format("{0:#,0.##} {1}", Convert.ToDouble(getHoaDon.FirstOrDefault().hoadon_phaitra), "đ");
        // lblPercent.Text = getHoaDon.FirstOrDefault().hoadon_magiamgia + "";

    }

    protected void btnXacNhan_Click(object sender, EventArgs e)
    {
        tb_HoaDon update = db.tb_HoaDons.Where(x => x.hoadon_id == Convert.ToInt32(RouteData.Values["id"])).FirstOrDefault();
        update.hoadon_tinhtrang_bill = "Đã in";
        db.SubmitChanges();
        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "AlertBox", "swal('Hoàn thành!', '','success').then(function(){window.location = '/admin-hoa-don-thanh-toan';})", true);
    }
}