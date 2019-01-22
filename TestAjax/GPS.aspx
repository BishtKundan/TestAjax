<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GPS.aspx.cs" Inherits="TestAjax.GPS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        function newLocation() {
            window.location.href = 'GeoMap.aspx';
            return false;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div><a href="default.aspx">Home</a></div>
            <div>
                <h1>Cab GPS Position</h1>
            </div>

            <div style="background-color: #D5FFFF;">
                <asp:Button ID="btnShow" runat="server" Text="Show CAB details" OnClick="btnShow_Click" />
                <asp:HyperLink ID="lnkCabLocation" runat="server">Show CAB on Map</asp:HyperLink>
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                <br />
            </div>
            <div style="background-color: #FFE1E1;">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblLOcation" runat="server" Text="Location"></asp:Label></td>
                        <td>
                            <asp:DropDownList ID="lstLocation" runat="server" Height="20px" Width="241px" AutoPostBack="True" OnSelectedIndexChanged="lstLocation_SelectedIndexChanged"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblVehicleNo" runat="server" Text="Vehicle Number"></asp:Label></td>
                        <td>
                            <asp:DropDownList ID="lstVehicle" runat="server" Height="20px" Width="237px"></asp:DropDownList></td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="lblVehicleText" runat="server" Text="Vehicle Number"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtVehicleno" runat="server" MaxLength="15" Width="178px"></asp:TextBox>

                        </td>
                    </tr>

                    <tr>
                        <td>&nbsp;</td>

                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
