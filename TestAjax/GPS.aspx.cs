using System;
using Newtonsoft.Json.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace TestAjax
{
    public partial class GPS : System.Web.UI.Page
    {

        //string strConn = @"Data Source = BES01L4KBISHT\SQLEXPRESS; Initial Catalog = hellodb; User Id = hello; Password=hello";
        string strConn = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            strConn = System.Configuration.ConfigurationManager.AppSettings["ConnSTR"];

            lnkCabLocation.NavigateUrl = "GeoMap.aspx";


            if (!this.IsPostBack)
            {
                FillLocation();
                FillVehicles();
            }
        }

        private void FillLocation()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(strConn))
                {

                    SqlCommand cmd = new SqlCommand("select loccode, locname from LKPLOCATION where ACTIVE = 'Y'", conn);
                    cmd.CommandType = CommandType.Text;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    lstLocation.DataSource = ds.Tables[0].DefaultView;
                    lstLocation.DataValueField = "loccode";
                    lstLocation.DataTextField = "locname";
                    lstLocation.DataBind();
                }
            }
            catch (Exception ex)
            {

                Label1.Text = ex.Message;
            }
        }

        private void FillVehicles()
        {
            string strLoccode = lstLocation.SelectedItem.Value;

            try
            {

                lstVehicle.ClearSelection();
                using (SqlConnection conn = new SqlConnection(strConn))
                {

                    SqlCommand cmd = new SqlCommand("SELECT VEHICLEID,VEHICLENO FROM MSTVEHICLE WHERE ACTIVE = 1 AND LOCCODE = '" + strLoccode + "' ORDER BY VEHICLENO", conn);
                    cmd.CommandType = CommandType.Text;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    lstVehicle.DataSource = ds.Tables[0].DefaultView;
                    lstVehicle.DataValueField = "VEHICLEID";
                    lstVehicle.DataTextField = "VEHICLENO";
                    lstVehicle.DataBind();
                }
            }
            catch (Exception ex)
            {

                Label1.Text = ex.Message;
            }

        }

        protected void lstLocation_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillVehicles();
        }
        protected void btnShow_Click(object sender, EventArgs e)
        {

            string strLoccode = lstLocation.SelectedItem.Value;
            string strVehicleno = string.Empty;
            string url;

            if (txtVehicleno.Text.Trim().Length > 4)
                strVehicleno = txtVehicleno.Text.Trim();
            else

                strVehicleno = lstVehicle.SelectedItem.Text;

            string strResponse = string.Empty;
            url = System.Configuration.ConfigurationManager.AppSettings["DHANUKAAPIURL"];
            url = url.Replace("{0}", strLoccode);
            url = url.Replace("{1}", strVehicleno);

            strResponse = CCommon.GET(url);
            //Label1.Text = strResponse;
            DisplayResult(strResponse);
        }

        private void DisplayResult(string strResponse)
        {
            string strlat, strlong;

            JObject o = null;
            StringBuilder sb = new StringBuilder();

            try

            {

                o = JObject.Parse(strResponse);

                sb.Append("<table border=1>");

                sb.AppendFormat("<tr><td>{0}</td><td>{1}</td></tr>", "Vehicle No:", (string)o["data"]["VehicleNumber"]);
                sb.AppendFormat("<tr><td>{0}</td><td>{1}</td></tr>", "Trackingtime:", (string)o["data"]["Trackingtime"]);
                sb.AppendFormat("<tr><td>{0}</td><td>{1}</td></tr>", "Address :", (string)o["data"]["Address"]);
                sb.AppendFormat("<tr><td>{0}</td><td>{1}</td></tr>", "Speed: ", (string)o["data"]["Speed"]);
                sb.AppendFormat("<tr><td>{0}</td><td>{1}</td></tr>", "Longitude:", (string)o["data"]["Longitude"]);
                sb.AppendFormat("<tr><td>{0}</td><td>{1}</td></tr>", "Latitude:", (string)o["data"]["Latitude"]);

                strlat = (string)o["data"]["Latitude"];
                strlong = (string)o["data"]["Longitude"];

                sb.Append("</table>");

                Literal1.Text = sb.ToString();

                lnkCabLocation.NavigateUrl = "GeoMap.aspx?LATITUDE=" + strlat + "&LONGITUDE=" + strlong;
            }

            catch (Exception ex)
            {
                Label1.Text = ex.Message;
            }
        }
    }
}