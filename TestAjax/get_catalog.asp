<%
Dim conn
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=SQLOLEDB; Data Source=DESKTOP-IMAVSQP; Initial Catalog=KBDB; User Id=sa; Password=superadmin@1"

'If conn.errors.count = 0 Then   
'   Response.Write "Connected OK"
'End If

Dim query
query = "SELECT row_number() over (order by title) SNO,TITLE,ARTIST,COUNTRY FROM CD_CATALOG"

Set rs = conn.Execute(query)
If conn.Errors.Count > 0 Then
	Response.Write "Error: " & Err.Description
Else
	Response.Write "<html><body><table><tr>"
	For Each objField in rs.Fields
		Response.Write "<td>" & objField.Name & "</td>"
	Next
	Response.Write "</tr>"

	While Not rs.EOF
		Response.Write "<tr>"
		For Each objField in rs.Fields
			Response.Write "<td>" & rs(objField.Name) & "</td>"
		Next
		rs.MoveNext
		Response.Write "</tr>"
	Wend
	
	rs.Close

End If

conn.Close
Set conn = Nothing

%>