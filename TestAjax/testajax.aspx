<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testajax.aspx.cs" Inherits="TestAjax.testajax" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }

        th, td {
            padding: 5px;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <div><a href="default.aspx">Home</a></div>
        
        <h1>The XMLHttpRequest Object</h1>


        <button type="button" onclick="loadDoc()">Get my CD collection from XML</button>
        <button type="button" onclick="loadDocSQL()">Get my CD collection from SQL SERVER</button>
        <br />
        <a href="GPS.aspx" target="_blank">GPS</a>
        <table id="demo"></table>
        <span id="spnDemo"></span>
        <br />
        <script>
            function loadDoc() {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        myFunction(this);
                    }
                };
                xhttp.open("GET", "cd_catalog.xml", true);
                xhttp.send();
            }

            function myFunction(xml) {
                var i;
                var xmlDoc = xml.responseXML;
                var table = "<table><tr><th>Artist</th><th>Title</th><th>Company</th></tr>";
                var x = xmlDoc.getElementsByTagName("CD");
                for (i = 0; i < x.length; i++) {
                    table += "<tr><td>" + x[i].getElementsByTagName("ARTIST")[0].childNodes[0].nodeValue +
                        "</td><td>" + x[i].getElementsByTagName("TITLE")[0].childNodes[0].nodeValue + "</td>" +
                        "</td><td>" + x[i].getElementsByTagName("COMPANY")[0].childNodes[0].nodeValue + "</td></tr>";
                }
                table += "</table>";
                document.getElementById("spnDemo").innerHTML = table;
            }

            function loadDocSQL() {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        myFunctionSQL(this);
                    }
                };
                xhttp.open("GET", "get_catalog.asp", true);
                xhttp.send();
            }

            function myFunctionSQL(x) {
                document.getElementById("spnDemo").innerHTML = x.responseText;
            }

        </script>
    </form>
</body>
</html>
