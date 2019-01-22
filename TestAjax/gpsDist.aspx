<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gpsDist.aspx.cs" Inherits="TestAjax.gpsDist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Google Map API Distance</title>
    <style>
        .colHdr {
            font-weight:bold;
            font-size :15px;
            color:blue;
            font-family:Calibri; 
        }

        .colData {
            font-size :15px;
            color:blue;
            font-family:Calibri; 
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div><a href="default.aspx">Home</a></div>
            <asp:Button ID="btnShow" runat="server" OnClick="btnShow_Click" Text="Show" />
        <br />
            <asp:Label ID="Label2" runat="server" CssClass="colHdr"> Source: Bestech 28.404361, 77.043254 Destination :  Gyan Khand 1 28.639471, 77.349470  </asp:Label>
        <div>
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
