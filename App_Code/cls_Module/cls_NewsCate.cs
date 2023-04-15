using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Summary description for cls_NewsCate
/// </summary>
public class cls_NewsCate
{
    dbcsdlDataContext db = new dbcsdlDataContext();
	public cls_NewsCate()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public bool Linq_Them(int newscate_position, string newscate_title, bool newscate_active, string SEO_KEYWORD, string SEO_TITLE, string SEO_LINK, string SEO_DEP, string SEO_IMAGE)
    {
        tb_NewsCate insert = new tb_NewsCate();
        insert.newscate_title = newscate_title;
        insert.newscate_active = newscate_active;
        insert.newscate_position = newscate_position;
        if (SEO_KEYWORD != "")
        {
            insert.meta_keywords = SEO_KEYWORD;
        }
        else
        {
            insert.meta_keywords = newscate_title + ", " + cls_ToAscii.ToAscii(newscate_title.ToLower());
        }
        if (SEO_TITLE != "")
        {
            insert.meta_title = SEO_TITLE;
        }
        else
        {
            insert.meta_title = newscate_title + " | " + cls_ToAscii.ToAscii(newscate_title.ToLower());
        }

        if (SEO_DEP != "")
        {
            insert.meta_description = SEO_DEP;
        }
        else
        {
            insert.meta_description = newscate_title + " | " + cls_ToAscii.ToAscii(newscate_title.ToLower());
        }
        insert.meta_image = SEO_IMAGE;
        db.tb_NewsCates.InsertOnSubmit(insert);
        if (SEO_LINK != "")
        {
            insert.link_seo = SEO_LINK;
        }
        else
        {
            //insert.link_seo = "http://lang-da-non-nuoc.net/" + cls_ToAscii.ToAscii(newscate_title.ToLower()) + "-" + insert.newscate_id;
        }
        try
        {
            db.SubmitChanges();
            return true;
        }
        catch
        {
            return false;
        }
    }
    public bool Linq_Sua(int newscate_id, int newscate_position, string newscate_title, bool newscate_active, string SEO_KEYWORD, string SEO_TITLE, string SEO_LINK, string SEO_DEP, string SEO_IMAGE)
    {
        tb_NewsCate update = db.tb_NewsCates.Where(x => x.newscate_id == newscate_id).FirstOrDefault();
        update.newscate_title = newscate_title;
        update.newscate_position = newscate_position;
        update.newscate_active= newscate_active;
        if (SEO_KEYWORD != "")
        {
            update.meta_keywords = SEO_KEYWORD;
        }
        else
        {
            update.meta_keywords = newscate_title + ", " + cls_ToAscii.ToAscii(newscate_title.ToLower());
        }
        if (SEO_TITLE != "")
        {
            update.meta_title = SEO_TITLE;
        }
        else
        {
            update.meta_title = newscate_title + " | " + cls_ToAscii.ToAscii(newscate_title.ToLower());
        }

        if (SEO_DEP != "")
        {
            update.meta_description = SEO_DEP;
        }
        else
        {
            update.meta_description = newscate_title + " | " + cls_ToAscii.ToAscii(newscate_title.ToLower());
        }
        update.meta_image = SEO_IMAGE;
        if (SEO_LINK != "")
        {
            update.link_seo = SEO_LINK;
        }
        else
        {
            update.link_seo = "http://lang-da-non-nuoc.net/" + cls_ToAscii.ToAscii(newscate_title.ToLower()) + "-" + update.newscate_id;
        }
        try
        {
            db.SubmitChanges();
            return true;
        }
        catch
        {
            return false;
        }
    }
    public bool Linq_Xoa( int newscate_id)
    {
        tb_NewsCate delete = db.tb_NewsCates.Where(x => x.newscate_id == newscate_id).FirstOrDefault();
        db.tb_NewsCates.DeleteOnSubmit(delete);
        try
        {
            db.SubmitChanges();
            return true;
        }
        catch
        {
            return false;
        }
    }
}