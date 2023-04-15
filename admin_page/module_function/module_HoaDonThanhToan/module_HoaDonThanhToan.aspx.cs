using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_ThanhToan_module_DatLich_module_QuanLyDichVu : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    protected int _id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["UserName"] != null)
        {
            if (!IsPostBack)
            {
                Session["_id"] = 0;
            }
            loadata();
        }
        else
        {
            Response.Redirect("/admin-login");
        }
    }

    protected void loadata()
    {
        var getData = from hd in db.tb_HoaDons
                      where hd.hoadon_tinhtrang != "Order" && (hd.hoadon_tinhtrang_bill == null || hd.hoadon_tinhtrang_bill != "Đã in")
                      orderby hd.hoadon_id descending
                      //join dv in db.tb_DichVus on hd.dichvu_id equals dv.dichvu_id

                      select new
                      {
                          hd.hoadon_id,
                          hd.hoadon_code,
                          hd.hoadon_createdate,
                          hd.hoadon_sodienthoaikhachhang,
                          hd.hoadon_tongtien,
                          hd.hoadon_tinhtrang,
                          hd.hoadon_magiamgia,
                          hd.hoadon_diachigiaohang,
                          hd.hoadontam_LoaiThanhToan,
                          hd.hoadon_TenKhachHang,
                          hd.hoadon_phaitra,
                      };
        grvList.DataSource = getData;
        grvList.DataBind();
    }
    protected void btnThem_Click(object sender, EventArgs e)
    {
        Response.Redirect("/admin-xu-ly-hoa-don-thanh-toan-0");
        //Session["_id"] = 0;
        //dteNgayVao.Value = DateTime.Now.ToString("yyyy-MM-dd").Replace(" ", "T");

        //getAllDataBindToTable();

        //ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Insert", "popupControl.Show();", true);

        //loadata();
    }
    protected void getAllDataBindToTable()
    {
    }
    protected void btnChiTiet_Click(object sender, EventArgs e)
    {
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "hoadon_id" });
        if (selectedKey.Count > 0)
        {
            if (selectedKey.Count == 1)
                Response.Redirect("/admin-xu-ly-hoa-don-thanh-toan-" + selectedKey[0]);
            else
                alert.alert_Warning(Page, "Bạn chỉ được chọn 1 dữ liệu để xem", "");
        }
        else
            alert.alert_Warning(Page, "Bạn chưa chọn dữ liệu", "");
    }
    protected void btnLuu_Click(object sender, EventArgs e)
    {

    }

    protected void btnXoa_Click(object sender, EventArgs e)
    {

    }

    protected void btnPrint_Click(object sender, EventArgs e)
    {
        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "hoadon_id" }));
        Response.Redirect("/admin-in-hoa-don-" + _id);
    }

    protected void btnXacNhan_Click(object sender, EventArgs e)
    {
        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "hoadon_id" }));
        tb_HoaDon update = (from hd in db.tb_HoaDons where hd.hoadon_id == Convert.ToInt32(hd.hoadon_id == _id) select hd).FirstOrDefault();
        update.hoadon_tinhtrang = "Đã hoàn thành";
        db.SubmitChanges();
        alert.alert_Success(Page, "Đã hoàn thành", "");
        tbThongBaoTuQuanTri insert = new tbThongBaoTuQuanTri();
        insert.thongbao_content = "Đơn hàng đã được xác nhận";
        insert.thongbao_link = "thong-tin-don-hang";
        insert.khachhang_id = update.khachhang_id;
        db.tbThongBaoTuQuanTris.InsertOnSubmit(insert);
        db.SubmitChanges();
    }
}