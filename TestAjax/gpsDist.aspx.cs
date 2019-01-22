using System;
using Newtonsoft.Json.Linq;
using System.IO;
using System.Text;

namespace TestAjax
{
    public partial class gpsDist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            string url;

            string strResponse = string.Empty;
            url = @"https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=28.514922,77.085373&destinations=28.639471%2C77.3494702%7C28.579471%2C77.349470%7C28.564449%2C77.386243&key=AIzaSyAh6fWrqkQI3rK3uJXGbCgPXBt-ntStwpI";

            //url = System.Configuration.ConfigurationManager.AppSettings["DHANUKAAPIURL"];
            strResponse = CCommon.GET(url);
            //Label1.Text = strResponse;
            DisplayResult(strResponse);
            // Bestech 28.404361, 77.043254
            // Gyan Khand 1 28.639471, 77.349470
            //Jasola Vihar %7C28.547444%2C77.289726

            //28.564449, 77.386243    mahagun moderne
            // 28.514922, 77.085373    office
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
                sb.AppendFormat("<tr><td class='colHdr'>Source Address</td><td class='colHdr'>Destination Address</td><td class='colHdr'>Distance</td><td class='colHdr'>Duration</td></tr>");
                for (int i = 0; i < ((Newtonsoft.Json.Linq.JContainer)o["destination_addresses"]).Count; i++)
                {
                    sb.AppendFormat("<tr><td class='colData'>{0}</td><td class='colData'>{1}</td><td class='colData'>{2}</td><td class='colData'>{3}</td></tr>", (string)o["origin_addresses"][0], (string)o["destination_addresses"][i], o["rows"][0]["elements"][i]["distance"]["text"], o["rows"][0]["elements"][i]["duration"]["text"]);
                }
                sb.Append("</table>");

                Literal1.Text = sb.ToString();
                // Literal1.Text = strResponse;


                //lnkCabLocation.NavigateUrl = "GeoMap.aspx?LATITUDE=" + strlat + "&LONGITUDE=" + strlong;
            }

            catch (Exception ex)
            {
                Label1.Text = ex.Message;
            }
        }
    }
}