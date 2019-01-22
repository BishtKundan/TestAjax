<%
Dim conn
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=SQLOLEDB; Data Source=DESKTOP-IMAVSQP; Initial Catalog=KBDB; User Id=sa; Password=superadmin@1"

dim strLat
dim strLng

strLat=Request.Form("lat")
strLng=Request.Form("lng")

Dim query
query = "insert into latlng (lat,lng) values ('" + strLat + "','" + strLng   +"')"
Set rs = conn.Execute(query)
conn.Close
Set conn = Nothing

%>