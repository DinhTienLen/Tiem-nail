using DevExpress.Web.ASPxHtmlEditor;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_ThongTinLienHe : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    cls_ThongTinLienHe cls = new cls_ThongTinLienHe();
    public string image;
    private int _id;
    protected void Page_Load(object sender, EventArgs e)
    {
        // Kiểm tra session login nếu khác null thì vào form xử lý
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
        // load data đổ vào var danh sách(grv)
        var getData = from i in db.tb_ThongTinLienHes
                      select new
                      {
                          i.thongtinlienhe_id,
                          i.thongtinlienhe_facebook,
                          i.thongtinlienhe_zalo,
                          i.thongtinlienhe_instargram,
                          i.thongtinlienhe_image,
                          i.thongtinlienhe_sodienthoai,
                          i.thongtinlienhe_diachi,
                          i.thongtinlienhe_youtube,
                          i.thongtinlienhe_gmail,
                          i.thongtinlienhe_website,
                      };
        // đẩy dữ liệu vào gridivew
        grvList.DataSource = getData;
        grvList.DataBind();
    }
    protected void btnChiTiet_Click(object sender, EventArgs e)
    {
        // Lấy value từ việc click vào 1 dòng của gridview
        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "thongtinlienhe_id" }));
        // đẩy id vào session
        Session["_id"] = _id;
        var getData = (from i in db.tb_ThongTinLienHes
                       select new
                       {
                           i.thongtinlienhe_id,
                           i.thongtinlienhe_facebook,
                           i.thongtinlienhe_zalo,
                           i.thongtinlienhe_instargram,
                           i.thongtinlienhe_image,
                           i.thongtinlienhe_sodienthoai,
                           i.thongtinlienhe_diachi,
                           i.thongtinlienhe_youtube,
                           i.thongtinlienhe_gmail,
                           i.thongtinlienhe_website,
                       }).Single();
        txtFacebook.Text = getData.thongtinlienhe_facebook;
        TxtZalo.Text = getData.thongtinlienhe_zalo;
        TxtIns.Text = getData.thongtinlienhe_instargram;
        txtPhone.Text = getData.thongtinlienhe_sodienthoai;
        txtDiaChi.Text = getData.thongtinlienhe_diachi;
        txtwebsite.Text = getData.thongtinlienhe_website;
        txtgmail.Text = getData.thongtinlienhe_gmail;
        txtyoutube.Text = getData.thongtinlienhe_youtube;
        txtImage.Value = getData.thongtinlienhe_image;
        image = getData.thongtinlienhe_image;
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show();showImg1_1('" + image + "'); ", true);
    }

    protected void btnLuu_Click(object sender, EventArgs e)
    {
        if (Session["_id"].ToString() == "2")
        {
            if (cls.Sua_ThongTinLienHe(Convert.ToInt32(Session["_id"].ToString()), txtFacebook.Text, TxtZalo.Text, TxtIns.Text, txtPhone.Text, txtDiaChi.Text, txtyoutube.Text, txtgmail.Text, txtwebsite.Text, image))
            {
                alert.alert_Success(Page, "Cập nhật thành công", "");
                popupControl.ShowOnPageLoad = false;
            }
            else alert.alert_Error(Page, "Cập nhật thất bại", "");
        }
        loadData();
    }
}