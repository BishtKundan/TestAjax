using System;

namespace TestAjax
{
    public partial class GeoMap : System.Web.UI.Page
    {
        protected string strLat, strLang;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Count == 0)
            {
                Server.Transfer("gps.aspx");
                Response.End();
            }

            if (Request.QueryString[0] != null)
            {
                strLat = Request.QueryString[0].ToString();
            }
            if (Request.QueryString[1] != null)
            {
                strLang = Request.QueryString[1].ToString();
            }
        }
    }
}