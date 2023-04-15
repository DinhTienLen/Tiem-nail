using DevExpress.Web.ASPxHtmlEditor;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_MaGiamGia : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    private int _id;
    protected string soluong,_code;
    protected void Page_Load(object sender, EventArgs e)
    {
        // Kiểm trả session login nếu khác null thì vào form xử lý
        // edtnoidung.Toolbars.Add(HtmlEditorToolbar.CreateStandardToolbar1());
        if (Request.Cookies["UserName"].Value != null)
        {
            if (!IsPostBack)
            {
                Session["_id"] = 0;
            }
            loadData();
        }
        // nếu session = null thì trả về trang login
        else
        {
            Response.Redirect("/admin-login");
        }

    }
    private void loadData()
    {
        var getData = from dv in db.tb_MaGiamGias
                      join l in db.tb_LoaiMaGiamGias on dv.loaigiamgia_id equals l.loaimagiamgia_id
                      where dv.magiamgia_hiden==false && dv.magiamgia_ngayketthuc>= DateTime.Now
                      orderby dv.magiamgia_id descending
                      select new { 
                      l.loaimagiamgia_name,
                      dv.magiamgia_id,
                      dv.magiamgia_name,
                      dv.magiamgia_sogiam,
                      dv.magiamgia_ngaybatdau,
                      dv.magiamgia_ngayketthuc,
                      dv.magiamgia_soluong,
                      dv.magiamgia_code
                      };
        grvList.DataSource = getData;
        grvList.DataBind();
        ddlloaisanpham.DataSource = from l in db.tb_LoaiMaGiamGias select l;
        ddlloaisanpham.DataBind();
    }
    private void setNULL()
    {
        txttenmagiamgia.Text = "";
        txtsoluong.Text = "";
        dteNgayBatDau.Value = "";
        dteNgayKetThuc.Value = "";
    }
    protected void btnThem_Click(object sender, EventArgs e)
    {
        // Khi nhấn nút thêm thì mật định session id = 0 để thêm mới
        Session["_id"] = 0;
        // gọi hàm setNull để trả toàn bộ các control về rỗng
        setNULL();
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Insert", "popupControl.Show();", true);
    }
    protected void btnChiTiet_Click(object sender, EventArgs e)
    {
        // get value từ việc click vào gridview
        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "magiamgia_id" }));
        // đẩy id vào session
        Session["_id"] = _id;
        var getData = (from nc in db.tb_MaGiamGias
                       join lmg in db.tb_LoaiMaGiamGias on nc.loaigiamgia_id equals lmg.loaimagiamgia_id
                       where nc.magiamgia_id == _id
                       select new { 
                        lmg.loaimagiamgia_name,
                        nc.magiamgia_name,
                        nc.magiamgia_ngaybatdau,
                        nc.magiamgia_ngayketthuc,
                        nc.magiamgia_soluong,
                        nc.magiamgia_sogiam,
                       }).FirstOrDefault();
        txttenmagiamgia.Text = getData.magiamgia_name;
        dteNgayBatDau.Value = getData.magiamgia_ngaybatdau.Value.ToString("yyyy-MM-dd").Replace(' ', 'T');
        dteNgayKetThuc.Value = getData.magiamgia_ngayketthuc.Value.ToString("yyyy-MM-dd").Replace(' ', 'T');
        txtsoluong.Text = getData.magiamgia_soluong+"";
        txtPhanTram.Text = getData.magiamgia_sogiam+"";
        ddlloaisanpham.Text = getData.loaimagiamgia_name;
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show();", true);
    }
    protected void btnXoa_Click(object sender, EventArgs e)
    {
        
        cls_MaGiamGia cls;
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "magiamgia_id" });
        if (selectedKey.Count > 0)
        {
            foreach (var item in selectedKey)
            {
                cls = new cls_MaGiamGia();
                    if (cls.Xoa_MaGiamGia(Convert.ToInt32(item)))
                    {
                        alert.alert_Success(Page, "Xóa thành công", "");
                    }
                    else
                        alert.alert_Error(Page, "Xóa thất bại", "");
            }
        }
        else
            alert.alert_Warning(Page, "Bạn chưa chọn dữ liệu", "");
    }

    public bool checknull()
    {
        if (txttenmagiamgia.Text != "" && txtsoluong.Text != "" && Convert.ToDateTime(dteNgayBatDau.Value) < Convert.ToDateTime(dteNgayKetThuc.Value))
            return true;
        else return false;
    }

    protected void btnLuu_Click(object sender, EventArgs e)
    {
        soluong = txtsoluong.Text;
        //tạo ra mã giảm giá mới
        cls_MaGiamGia cls = new cls_MaGiamGia();
        if (checknull() == false)
            alert.alert_Warning(Page, "Nhập đầy đủ thông tin hoặc kiểm tra lại ngày bắt đầu và ngày kết thúc có hợp lệ hay không!", "");
        else
        {
            if (Session["_id"].ToString() == "0")
            {
                
                    if (cls.Them_MaGiamGia( Convert.ToInt32(ddlloaisanpham.Value),txttenmagiamgia.Text, Convert.ToInt32(txtPhanTram.Text), Convert.ToInt32(txtsoluong.Text), Convert.ToDateTime(dteNgayBatDau.Value), Convert.ToDateTime(dteNgayKetThuc.Value)))
                    {
                        alert.alert_Success(Page, "Thêm thành công", "");
                        popupControl.ShowOnPageLoad = false;
                    }
                    else alert.alert_Error(Page, "Thêm thất bại", "");
            }
            else
            {
                if (cls.Sua_MaGiamGia(Convert.ToInt32(Session["_id"].ToString()),Convert.ToInt32(ddlloaisanpham.Value), Convert.ToInt32(txtPhanTram.Text), Convert.ToInt32(txtsoluong.Text), Convert.ToDateTime(dteNgayBatDau.Value), Convert.ToDateTime(dteNgayKetThuc.Value)))
                {
                    alert.alert_Success(Page, "Cập nhật thành công", "");
                    popupControl.ShowOnPageLoad = false;
                }
                else alert.alert_Error(Page, "Cập nhật thất bại", "");
            }
            loadData();
        }
    }

    protected void btnGuiMaKhachHang_Click(object sender, EventArgs e)
    {
        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "magiamgia_id" }));
        tb_MaGiamGia update = (from k in db.tb_MaGiamGias where k.magiamgia_id == _id select k).FirstOrDefault();
        var getIDKhachHang = from kh in db.tb_KhachHangs where kh.khachhang_username ==txtKhachHang.Value select kh;
        update.magiamgia_hiden = true;
        update.magiamgia_khachhangid = Convert.ToInt32(getIDKhachHang.FirstOrDefault().khachhang_id);
        db.SubmitChanges();
        alert.alert_Success(Page, "Đã chuyển mã khách hàng", "");
        loadData();
    }
}