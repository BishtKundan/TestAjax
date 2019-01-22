<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GeoMap.aspx.cs" Inherits="TestAjax.GeoMap" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<html>  
  <head>  
    <title></title>  
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">  
    <meta charset="utf-8">  
    <style type="text/css">  
      html, body, #canvasMap {  
        height: 100%;  
        margin: 0px;  
        padding: 0px  
      }  
    </style>  
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAh6fWrqkQI3rK3uJXGbCgPXBt-ntStwpI&callback=initMap"></script>  
    <script type="text/javascript">  
        var map;  
        function LoadGoogleMAP() {  
            var SetmapOptions = {  
                zoom: 15,  
                mapTypeId:google.maps.MapTypeId.ROADMAP,
                center: new google.maps.LatLng(<%= strLat %>, <%= strLang %>)
            };  

            map = new google.maps.Map(document.getElementById('canvasMap'), SetmapOptions);  

             var marker = new google.maps.Marker({
                position: new google.maps.LatLng(<%= strLat %>, <%= strLang %>),
                map: map,
                title: 'Click me'
            });

        }

        google.maps.event.addDomListener(window, 'load', LoadGoogleMAP);  
    </script>  
  </head>  
  <body>  
    <div id="canvasMap"> </div>  
  </body>  
</html>  