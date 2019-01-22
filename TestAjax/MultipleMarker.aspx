<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MultipleMarker.aspx.cs" Inherits="MultipleMarker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>

<script type ="text/javascript">
    var map; var infowindow;
    function InitializeMap() {
        var latlng = new google.maps.LatLng(40.756, -73.986);
        var myOptions =
        {
            zoom: 8,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map(document.getElementById("map"), myOptions);
    }


    function markicons() {

        InitializeMap();

        var ltlng = [];

        ltlng.push(new google.maps.LatLng(17.22, 78.28));
        ltlng.push(new google.maps.LatLng(13.5, 79.2));
        ltlng.push(new google.maps.LatLng(15.24, 77.16));

        map.setCenter(ltlng[0]);
        for (var i = 0; i <= ltlng.length; i++) {
            marker = new google.maps.Marker({
                map: map,
                position: ltlng[i]
            });

            (function (i, marker) {

                google.maps.event.addListener(marker, 'click', function () {

                    if (!infowindow) {
                        infowindow = new google.maps.InfoWindow();
                    }

                    infowindow.setContent("Message" + i);

                    infowindow.open(map, marker);

                });

            })(i, marker);

        }

    }

    window.onload = markicons; 

</script>
<h2>Multiple Markers Demo:</h2>
<div id ="map"   
        style="width: 896px; top: 51px; left: 32px; position: absolute; height: 400px">

</div>
</asp:Content>

