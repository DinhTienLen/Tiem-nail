using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_HoaDonThanhToan_module_XuLyHoaDonThanhToan : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    protected int /*_id,*/ STT = 1;
    private int _id;
    public int stt = 1;
    DataTable dtDichVu;
    int tongtien123;
    float tien;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["UserName"] != null)
        {
            _id = Convert.ToInt32(RouteData.Values["hoadon_id"]);
            if (!IsPostBack)
            {
                Session["_id"] = 0;
                Session["spDichVu"] = null;
                btnNhomDichVu.Visible = false;
                div_AlbumSanPham.Visible = false;
                var listNV = from nv in db.tb_MaGiamGias where nv.magiamgia_hiden == false && nv.magiamgia_ngayketthuc >= DateTime.Now select nv;
                ddlMaGiamGia.Items.Clear();
                ddlMaGiamGia.Items.Insert(0, "Chọn");
                ddlMaGiamGia.AppendDataBoundItems = true;
                ddlMaGiamGia.DataTextField = "magiamgia_name";
                ddlMaGiamGia.DataValueField = "magiamgia_id";
                ddlMaGiamGia.DataSource = listNV;
                ddlMaGiamGia.DataBind();
                dteNgay.Value = DateTime.Now.ToString("yyyy-MM-dd").Replace(' ', 'T');
                txtGiovao.Value = DateTime.Now.ToString("HH:mm");
                //Session["spDichVu"] = null;
                //makedatatable();
                dtDichVu = (DataTable)Session["spDichVu"];
                //rp_DichVu.DataSource = dtDichVu;
                //rp_DichVu.DataBind();
                if (_id != 0)
                {
                    if (dtDichVu != null)
                        dtDichVu.Rows.Clear();
                    loadDataHoaDon();
                }
                lblTongTienApDungMa.Text = "";
            }
            dtDichVu = (DataTable)Session["spDichVu"];
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", " setChecked()", true);
        }
        else
        {
            Response.Redirect("/admin-login");
        }
    }
    //private void getDVItem()
    //{
    //    txtDichVu_ID.Value = string.Join(";", dtDichVu.Rows.OfType<DataRow>().Select(r => r[0].ToString()));
    //    txtDichVu_ThanhTien.Value = string.Join(";", dtDichVu.Rows.OfType<DataRow>().Select(r => r[3].ToString()));
    //}
    private void loadDataHoaDon()
    {
        var getHoaDon = (from hd in db.tb_HoaDons
                             //join mgg in db.tb_MaGiamGias on hd.hoadon_magiamgia equals mgg.magiamgia_id
                         where hd.hoadon_id == _id
                         select new
                         {
                             hd.hoadon_id,
                             hd.hoadon_createdate,
                             hd.hoadon_giovao,
                             hd.hoadon_TenKhachHang,
                             hd.hoadon_sodienthoaikhachhang,
                             hd.hoadon_tongtien,
                             hd.hoadon_phaitra,
                             hd.hoadon_magiamgia,
                         }).FirstOrDefault();

        var getHoaDonChiTiet = from hdct in db.tb_HoaDonChiTiets
                               join sp in db.tb_SanPhams on hdct.sanpham_id equals sp.sanpham_id
                               where hdct.hoadon_id == _id
                               select new
                               {
                                   hdct.hoadonchitiet_id,
                                   hdct.hoadonchitiet_soluong,
                                   hdct.hoadonchitiet_dongia,
                                   hoadonchitiet_thanhtien = hdct.hoadonchitiet_soluong* hdct.hoadonchitiet_dongia,
                                   sp.sanpham_id,
                                   sp.sanpham_name,
                               };
        dteNgay.Value = getHoaDon.hoadon_createdate.Value.ToString("yyyy-MM-dd").Replace(' ', 'T');
        txtGiovao.Value = getHoaDon.hoadon_giovao;
        txtSoDienThoai.Value = getHoaDon.hoadon_sodienthoaikhachhang;
        txtTenKhach.Value = getHoaDon.hoadon_TenKhachHang;
        txtTienHang.Value = getHoaDon.hoadon_tongtien.ToString();
        //ddlMaGiamGia.SelectedIndex = ddlMaGiamGia.Items.IndexOf(ddlMaGiamGia.Items.FindByText(getHoaDon.magiamgia_name));
        lblPhantram.Text = getHoaDon.hoadon_magiamgia + "";
        lblTongTienApDungMa.Text = String.Format("{0:#,0.##} {1}", Convert.ToDouble(getHoaDon.hoadon_phaitra), "đ");
        foreach (var item in getHoaDonChiTiet)
        {
            if (Session["spDichVu"] == null)
            {
                makedatatable();
                DataRow row = dtDichVu.NewRow();
                row["dichvu_id"] = item.sanpham_id;
                row["dichvu_name"] = item.sanpham_name;
                row["dichvu_soluong"] = item.hoadonchitiet_soluong;
                row["dichvu_giatien"] = item.hoadonchitiet_dongia;
                row["dichvu_thanhtien"] = item.hoadonchitiet_dongia * item.hoadonchitiet_soluong;
                dtDichVu.Rows.Add(row);
                Session["spDichVu"] = dtDichVu;
            }
            else
            {
                DataRow row = dtDichVu.NewRow();
                row["dichvu_id"] = item.sanpham_id;
                row["dichvu_name"] = item.sanpham_name;
                row["dichvu_soluong"] = item.hoadonchitiet_soluong;
                row["dichvu_giatien"] = item.hoadonchitiet_dongia;
                row["dichvu_thanhtien"] = item.hoadonchitiet_dongia * item.hoadonchitiet_soluong;
                dtDichVu.Rows.Add(row);
                Session["spDichVu"] = dtDichVu;
            }
        }
        rp_DichVu.DataSource = dtDichVu;
        rp_DichVu.DataBind();
    }

    private void makedatatable()
    {
        try
        {
            if (dtDichVu == null)
            {
                dtDichVu = new DataTable();
                dtDichVu.Columns.Add("dichvu_id", typeof(int));
                dtDichVu.Columns.Add("dichvu_name", typeof(string));
                dtDichVu.Columns.Add("dichvu_soluong", typeof(int));
                dtDichVu.Columns.Add("dichvu_giatien", typeof(int));
                dtDichVu.Columns.Add("dichvu_thanhtien", typeof(int));
            }
        }
        catch { }
    }

    protected void loadata(string loaidichvu)
    {
        var getDV = from dv in db.tb_SanPhams
                    join lsp in db.tb_LoaiSanPhams on dv.loaisanpham_id equals lsp.loaisanpham_id
                    where lsp.sanpham_parent == loaidichvu
                    select new
                    {
                        dv.sanpham_id,
                        dv.sanpham_name,
                        dv.sanpham_giatien
                    };

        grvListDV.DataSource = getDV;
        grvListDV.DataBind();
        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", " setChecked()", true);
    }
    protected void loadataNhom(int loaidv)
    {
        var getDV = from dv in db.tb_SanPhams
                    join lsp in db.tb_LoaiSanPhams on dv.loaisanpham_id equals lsp.loaisanpham_id
                    where lsp.loaisanpham_id == loaidv
                    select new
                    {
                        dv.sanpham_id,
                        dv.sanpham_name,
                        dv.sanpham_giatien
                    };

        grvListDV.DataSource = getDV;
        grvListDV.DataBind();
        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", " setChecked()", true);
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {

    }

    protected void btnChonDichVu_ServerClick(object sender, EventArgs e)
    {
        try
        {
            int _id = Convert.ToInt32(txtIDDV.Value);
            var checkDichVu = (from dv in db.tb_SanPhams where dv.sanpham_id == _id select dv).SingleOrDefault();

            if (Session["spDichVu"] == null)
            {
                makedatatable();
                DataRow row = dtDichVu.NewRow();
                row["dichvu_id"] = checkDichVu.sanpham_id;
                row["dichvu_name"] = checkDichVu.sanpham_name;
                row["dichvu_soluong"] = 1;
                row["dichvu_giatien"] = checkDichVu.sanpham_giatien;
                row["dichvu_thanhtien"] = checkDichVu.sanpham_giatien;
                dtDichVu.Rows.Add(row);
                Session["spDichVu"] = dtDichVu;
            }
            else
            {
                dtDichVu = (DataTable)Session["spDichVu"];
                DataRow[] row_id = dtDichVu.Select("dichvu_id = '" + _id + "'");
                if (row_id.Length != 0)
                {
                    alert.alert_Warning(Page, "Sản phẩm này đã có trong danh sách nhập", "");
                }
                else
                {
                    DataRow row = dtDichVu.NewRow();
                    row["dichvu_id"] = checkDichVu.sanpham_id;
                    row["dichvu_name"] = checkDichVu.sanpham_name;
                    row["dichvu_soluong"] = 1;
                    row["dichvu_giatien"] = checkDichVu.sanpham_giatien;
                    row["dichvu_thanhtien"] = checkDichVu.sanpham_giatien;
                    dtDichVu.Rows.Add(row);
                    Session["spDichVu"] = dtDichVu;

                }
            }
            int sum = Convert.ToInt32(dtDichVu.Compute("SUM(dichvu_thanhtien)", string.Empty));
            //txtTienHang.Value = sum + "";
            txtTienHang.Value = String.Format("{0:#,0.##} {1}", Convert.ToDouble(sum + ""), "");
            lblTongTienApDungMa.Text = txtTienHang.Value;
            txtTongTienPhaiTra.Value = sum + "";
            rp_DichVu.DataSource = dtDichVu;
            rp_DichVu.DataBind();
            if (ddlMaGiamGia.SelectedValue != "Chọn")
            {
                tb_MaGiamGia getMaGiamGia = (from mgg in db.tb_MaGiamGias
                                             where mgg.magiamgia_id == Convert.ToInt32(ddlMaGiamGia.SelectedValue)
                                             select mgg).FirstOrDefault();
                lblPhantram.Text = getMaGiamGia.magiamgia_sogiam + "";
                float pt = float.Parse(getMaGiamGia.magiamgia_sogiam.ToString()) / 100;
                tien = Convert.ToInt32(txtTienHang.Value.Replace(".", "")) * (1 - pt);
                lblTongTienApDungMa.Text = tien.ToString();
                txtTongTienPhaiTra.Value = tien.ToString();
                lblTongTienApDungMa.Text = String.Format("{0:#,0.##} {1}", Convert.ToDouble(lblTongTienApDungMa.Text.ToString()), "đ");
            }
        }
        catch
        {
            alert.alert_Error(Page, "Đã có lỗi xảy ra. Liên hệ phòng ban IT !!!", "");
        }
    }
    protected void btnXoaDV_ServerClick(object sender, EventArgs e)
    {
        int _idDV = Convert.ToInt32(txtIDDV.Value);
        dtDichVu = (DataTable)Session["spDichVu"];
        foreach (DataRow row in dtDichVu.Rows)
        {
            string dichvu_id = row["dichvu_id"].ToString();
            if (dichvu_id == _idDV.ToString())
            {
                dtDichVu.Rows.Remove(row);
                Session["spDichVu"] = dtDichVu;
                break;
            }
        }
        int sum = Convert.ToInt32(dtDichVu.Compute("SUM(dichvu_thanhtien)", string.Empty));
        //txtTienHang.Value = sum + "";
        txtTienHang.Value = String.Format("{0:#,0.##} {1}", Convert.ToDouble(sum + ""), "");
        lblTongTienApDungMa.Text = txtTienHang.Value;
        txtTongTienPhaiTra.Value = sum + "";
        rp_DichVu.DataSource = dtDichVu;
        rp_DichVu.DataBind();
        if (ddlMaGiamGia.SelectedValue != "Chọn")
        {
            tb_MaGiamGia getMaGiamGia = (from mgg in db.tb_MaGiamGias
                                         where mgg.magiamgia_id == Convert.ToInt32(ddlMaGiamGia.SelectedValue)
                                         select mgg).FirstOrDefault();
            lblPhantram.Text = getMaGiamGia.magiamgia_sogiam + "";
            float pt = float.Parse(getMaGiamGia.magiamgia_sogiam.ToString()) / 100;
            tien = Convert.ToInt32(txtTienHang.Value.Replace(".", "")) * (1 - pt);
            lblTongTienApDungMa.Text = tien.ToString();
            txtTongTienPhaiTra.Value = tien.ToString();
            lblTongTienApDungMa.Text = String.Format("{0:#,0.##} {1}", Convert.ToDouble(lblTongTienApDungMa.Text.ToString()), "đ");
        }
        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "tinhTongTien()", true);
    }
    protected void btnUpdateDicVu_ServerClick(object sender, EventArgs e)
    {
        int _id = Convert.ToInt32(txtDichVu_ID.Value);
        dtDichVu = (DataTable)Session["spDichVu"];
        DataRow[] row_id = dtDichVu.Select("dichvu_id = '" + _id + "'");
        if (row_id.Length != 0)
        {
            foreach (DataRow r in dtDichVu.Rows)
            {
                if (r["dichvu_id"].ToString() == _id + "")
                {
                    r["dichvu_soluong"] = txtDichVu_SoLuong.Value;
                    r["dichvu_giatien"] = txtDichVu_DonGia.Value;
                    r["dichvu_thanhtien"] = txtDichVu_ThanhTien.Value;
                    Session["spDichVu"] = dtDichVu;
                    break;
                }
            }
        }
        else
        {

        }
        int sum = Convert.ToInt32(dtDichVu.Compute("SUM(dichvu_thanhtien)", string.Empty));
        //txtTienHang.Value = sum + "";
        txtTienHang.Value = String.Format("{0:#,0.##} {1}", Convert.ToDouble(sum + ""), "");
        lblTongTienApDungMa.Text = txtTienHang.Value;
        txtTongTienPhaiTra.Value = sum + "";
        rp_DichVu.DataSource = dtDichVu;
        rp_DichVu.DataBind();
        if (ddlMaGiamGia.SelectedValue != "Chọn")
        {
            tb_MaGiamGia getMaGiamGia = (from mgg in db.tb_MaGiamGias
                                         where mgg.magiamgia_id == Convert.ToInt32(ddlMaGiamGia.SelectedValue)
                                         select mgg).FirstOrDefault();
            lblPhantram.Text = getMaGiamGia.magiamgia_sogiam + "";
            float pt = float.Parse(getMaGiamGia.magiamgia_sogiam.ToString()) / 100;
            tien = Convert.ToInt32(txtTienHang.Value.Replace(".", "")) * (1 - pt);
            lblTongTienApDungMa.Text = tien.ToString();
            txtTongTienPhaiTra.Value = tien.ToString();
            lblTongTienApDungMa.Text = String.Format("{0:#,0.##} {1}", Convert.ToDouble(lblTongTienApDungMa.Text.ToString()), "đ");
        }
        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "tinhTongTien()", true);

    }

    protected void btnDichVu_ServerClick(object sender, EventArgs e)
    {
        // loadata("dichvu");
        btnNhomDichVu.Visible = true;
        div_AlbumSanPham.Visible = false;
    }

    //protected void btnAlbumMauNails_ServerClick(object sender, EventArgs e)
    //{
    //    loadata("albummaunails");
    //}

    protected void btnNailBox_ServerClick(object sender, EventArgs e)
    {
        loadata("nailbox");
        btnNhomDichVu.Visible = false;
        div_AlbumSanPham.Visible = false;
    }

    protected void btnDongGia_ServerClick(object sender, EventArgs e)
    {
        loadata("donggia69k");
        btnNhomDichVu.Visible = false;
        div_AlbumSanPham.Visible = false;
    }

    //protected void btnXuHuong_ServerClick(object sender, EventArgs e)
    //{
    //    loadata("xuhuong");
    //}

    protected void btnCoBan_ServerClick(object sender, EventArgs e)
    {
        loadataNhom(31);
    }

    protected void btnSonGel_ServerClick(object sender, EventArgs e)
    {
        loadataNhom(32);
    }

    protected void btnNoiMong_ServerClick(object sender, EventArgs e)
    {
        loadataNhom(43);
    }

    protected void btnDesignVe_ServerClick(object sender, EventArgs e)
    {
        loadataNhom(44);
    }

    protected void btnGoi_ServerClick(object sender, EventArgs e)
    {
        loadataNhom(34);
    }

    protected void btnTrietLong_ServerClick(object sender, EventArgs e)
    {
        loadataNhom(35);
    }
    protected string hamTuDongTang()
    {
        string nam = DateTime.Now.Year + "";
        var getMaHoaDon = from hd in db.tb_HoaDons
                          orderby hd.hoadon_code descending
                          where hd.hoadon_code.Contains(nam)
                          select hd;
        if (getMaHoaDon.Count() > 0)
        {
            string s;
            int k = 0;
            s = "HD";
            k = Convert.ToInt32(getMaHoaDon.FirstOrDefault().hoadon_code.ToString().Substring(6, 4));
            k = k + 1;
            if (k < 10)
                s = s + "000";
            else if (k < 100)
                s = s + "00";
            else if (k < 1000)
                s = s + "0";
            s = nam + s + k.ToString();
            return s;
        }
        else
        {
            return nam + "HD0001";
        }


    }
    protected void btnLuu_ServerClick(object sender, EventArgs e)
    {
        try
        {
            int giamgia = 0;
            if (ddlMaGiamGia.SelectedValue != "Chọn")
            {
                var getMaGiamGia = (from mgg in db.tb_MaGiamGias
                                    where mgg.magiamgia_id == Convert.ToInt32(ddlMaGiamGia.SelectedValue)
                                    select mgg).FirstOrDefault();
                giamgia = Convert.ToInt32(getMaGiamGia.magiamgia_sogiam);
            }
            if (txtTenKhach.Value == "")
            {
                alert.alert_Warning(Page, "Tên khách hàng không được để trống!", "");
            }
            else
            {
                if (_id == 0)
                {
                    //cls_TaoBill Bill = new cls_TaoBill();
                    tb_HoaDon insert = new tb_HoaDon();
                    insert.hoadon_code = hamTuDongTang();
                    insert.hoadon_createdate = Convert.ToDateTime(dteNgay.Value);
                    insert.hoadon_giovao = txtGiovao.Value;
                    insert.hoadon_TenKhachHang = txtTenKhach.Value;
                    //insert.hoadon_soluongkhachhang = Convert.ToInt32(txtSoLuongKhachHang.Value);
                    insert.hoadon_sodienthoaikhachhang = txtSoDienThoai.Value;
                    insert.hoadon_tongtien = Convert.ToDouble(txtTienHang.Value.Replace(".", ""));
                    insert.hoadon_magiamgia = giamgia;
                    insert.hoadon_phaitra = txtTongTienPhaiTra.Value;
                    insert.hoadon_tinhtrang = "Hoàn thành";
                    insert.hoadon_hidden = "Tạo đặt lịch";
                    insert.hoadontam_LoaiThanhToan = "Đặt lịch";
                    db.tb_HoaDons.InsertOnSubmit(insert);
                    db.SubmitChanges();
                    foreach (DataRow item in dtDichVu.Rows)
                    {
                        tb_HoaDonChiTiet insertDetail = new tb_HoaDonChiTiet();
                        insertDetail.hoadon_id = insert.hoadon_id;
                        insertDetail.sanpham_id = Convert.ToInt32(item["dichvu_id"].ToString());
                        insertDetail.hoadonchitiet_soluong = Convert.ToInt32(item["dichvu_soluong"].ToString());
                        insertDetail.hoadonchitiet_dongia = Convert.ToInt32(item["dichvu_giatien"].ToString());
                        insertDetail.hoadonchitiet_thanhtien = insertDetail.hoadonchitiet_dongia * insertDetail.hoadonchitiet_soluong;
                        db.tb_HoaDonChiTiets.InsertOnSubmit(insertDetail);
                        db.SubmitChanges();
                    }
                }
                else
                {
                    tb_HoaDon upHoaDon = (from hd in db.tb_HoaDons
                                          where hd.hoadon_id == _id
                                          select hd).FirstOrDefault();
                    upHoaDon.hoadon_createdate = Convert.ToDateTime(dteNgay.Value);
                    upHoaDon.hoadon_giovao = txtGiovao.Value;
                    upHoaDon.hoadon_TenKhachHang = txtTenKhach.Value;
                    upHoaDon.hoadon_sodienthoaikhachhang = txtSoDienThoai.Value;
                    upHoaDon.hoadon_tongtien = Convert.ToDouble(txtTienHang.Value.Replace(".", ""));
                    upHoaDon.hoadon_magiamgia = giamgia;
                    upHoaDon.hoadon_phaitra = txtTongTienPhaiTra.Value;
                    var getHoaDonChiTiet = from hdct in db.tb_HoaDonChiTiets where hdct.hoadon_id == _id select hdct;
                    db.tb_HoaDonChiTiets.DeleteAllOnSubmit(getHoaDonChiTiet);
                    db.SubmitChanges();
                    //lưu mới lại hóa đơn chi tiết
                    foreach (DataRow item in dtDichVu.Rows)
                    {
                        tb_HoaDonChiTiet insertDetail = new tb_HoaDonChiTiet();
                        insertDetail.hoadon_id = upHoaDon.hoadon_id;
                        insertDetail.sanpham_id = Convert.ToInt32(item["dichvu_id"].ToString());
                        insertDetail.hoadonchitiet_soluong = Convert.ToInt32(item["dichvu_soluong"].ToString());
                        insertDetail.hoadonchitiet_dongia = Convert.ToInt32(item["dichvu_giatien"].ToString());
                        insertDetail.hoadonchitiet_thanhtien = insertDetail.hoadonchitiet_dongia * insertDetail.hoadonchitiet_soluong;
                        db.tb_HoaDonChiTiets.InsertOnSubmit(insertDetail);
                        db.SubmitChanges();
                    }
                }
                alert.alert_Success(Page, "Thành công", "");
            }
        }
        catch (Exception ex)
        {
            alert.alert_Error(Page, "Lỗi", "");
        }

    }

    protected void ddlMaGiamGia_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlMaGiamGia.SelectedValue != "Chọn")
        {
            tb_MaGiamGia getMaGiamGia = (from mgg in db.tb_MaGiamGias
                                         where mgg.magiamgia_id == Convert.ToInt32(ddlMaGiamGia.SelectedValue)
                                         select mgg).FirstOrDefault();

            lblPhantram.Text = getMaGiamGia.magiamgia_sogiam + "";
            float pt = float.Parse(getMaGiamGia.magiamgia_sogiam.ToString()) / 100;
            //tien = Convert.ToInt32(txtTienHang.Value) * (1 - pt);
            //decimal a = Convert.ToDecimal(txtTienHang.Value);
            tien = Convert.ToInt32(txtTienHang.Value.Replace(".", "")) * (1 - pt);
            lblTongTienApDungMa.Text = tien.ToString();
            txtTongTienPhaiTra.Value = tien.ToString();
            lblTongTienApDungMa.Text = String.Format("{0:#,0.##} {1}", Convert.ToDouble(lblTongTienApDungMa.Text.ToString()), "đ");
        }
        else
        {
            lblPhantram.Text = "0";
            tien = Convert.ToInt32(txtTienHang.Value.Replace(".", ""));
            lblTongTienApDungMa.Text = tien.ToString();
            txtTongTienPhaiTra.Value = tien.ToString();
            lblTongTienApDungMa.Text = String.Format("{0:#,0.##} {1}", Convert.ToDouble(lblTongTienApDungMa.Text.ToString()), "đ");
        }
    }

    protected void btnGetTenKhachHang_ServerClick(object sender, EventArgs e)
    {
        var checkKhachHang = (from kh in db.tb_KhachHangs
                              where kh.khachhang_sodienthoai == txtSoDienThoai.Value.Trim()
                              select kh);
        if (checkKhachHang.Count() > 0)
        {
            txtTenKhach.Value = checkKhachHang.FirstOrDefault().khachhang_name;
        }
        else
        {
            txtTenKhach.Value = "KH00001";
        }
        if (ddlMaGiamGia.SelectedValue != "Chọn")
        {
            tb_MaGiamGia getMaGiamGia = (from mgg in db.tb_MaGiamGias
                                         where mgg.magiamgia_id == Convert.ToInt32(ddlMaGiamGia.SelectedValue)
                                         select mgg).FirstOrDefault();

            lblPhantram.Text = getMaGiamGia.magiamgia_sogiam + "";
            float pt = float.Parse(getMaGiamGia.magiamgia_sogiam.ToString()) / 100;
            //decimal a = Convert.ToDecimal(txtTienHang.Value);
            tien = Convert.ToInt32(txtTienHang.Value.Replace(".", "")) * (1 - pt);
            lblTongTienApDungMa.Text = tien.ToString();
            txtTongTienPhaiTra.Value = tien.ToString();
            lblTongTienApDungMa.Text = String.Format("{0:#,0.##} {1}", Convert.ToDouble(lblTongTienApDungMa.Text.ToString()), "đ");
        }
    }

    protected void btnMenuSanPham_ServerClick(object sender, EventArgs e)
    {
        var getData = from lnb in db.tb_LoaiSanPhams
                      where lnb.sanpham_parent == "albummaunails"
                      select new
                      {
                          lnb.loaisanpham_id,
                          lnb.loaisanpham_name,
                      };
        rpAlbumSanPham.DataSource = getData;
        rpAlbumSanPham.DataBind();
        div_AlbumSanPham.Visible = true;
        btnNhomDichVu.Visible = false;
    }

    protected void btnAlbumSanPham_ServerClick(object sender, EventArgs e)
    {
        int loaiDV = Convert.ToInt32(txtAlbumSanPham_Id.Value);
        var getDV = from dv in db.tb_SanPhams
                    join lsp in db.tb_LoaiSanPhams on dv.loaisanpham_id equals lsp.loaisanpham_id
                    where lsp.loaisanpham_id == loaiDV
                    select new
                    {
                        dv.sanpham_id,
                        dv.sanpham_name,
                        dv.sanpham_giatien
                    };

        grvListDV.DataSource = getDV;
        grvListDV.DataBind();
        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", " setChecked()", true);
    }

}