<!DOCTYPE html>
<html>
<head>
    <title>Geocoding Service</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
        /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
        #map {
            height: 100%;
        }
        /* Optional: Makes the sample page fill the window. */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        #floating-panel {
            position: absolute;
            top: 10px;
            left: 25%;
            z-index: 5;
            background-color: #fff;
            padding: 5px;
            border: 1px solid #999;
            text-align: center;
            font-family: 'Roboto','sans-serif';
            line-height: 30px;
            padding-left: 10px;
        }
    </style>
</head>
<body>
    <div id="floating-panel">
        <input id="address" type="textbox" value="334  Gyan Khand 1 indirapuram " style="width: 400px;">
        <input id="submit" type="button" value="Search">
    </div>
    <div id="map"></div>

    <script>
        var geocoder;
        var map;
        var infowindow;

        function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
                zoom: 14,
                //AIIMS
                center: { lat: 28.568032, lng: 77.209364 }
            });
            //var geocoder = new google.maps.Geocoder();
            geocoder = new google.maps.Geocoder();


            document.getElementById('submit').addEventListener('click', function () {
                geocodeAddress(geocoder, map);
            });
        }

        function geocodeAddress(geocoder, resultsMap) {
            var address = document.getElementById('address').value;
            geocoder.geocode({ 'address': address }, function (results, status) {
                if (status === 'OK') {

                    resultsMap.setCenter(results[0].geometry.location);

                    // Save result to Database
                    // alert(results[0].geometry.location);

                    var marker = new google.maps.Marker({
                        map: resultsMap,
                        draggable: true,
                        position: results[0].geometry.location

                    });

                    google.maps.event.addListener(marker, 'dragend', function () {
                        geocodePosition(marker.getPosition());
                    });

                } else {
                    alert('Geocode was not successful for the following reason: ' + status);
                }
            });
        }

        function geocodePosition(pos) {
            geocoder.geocode({
                latLng: pos
            }, function (responses) {
                if (responses && responses.length > 0) {
                    alert(responses[0].formatted_address + ', ' + responses[0].geometry.viewport.ma.j + ', ' + responses[0].geometry.viewport.ga.j);
                } else {
                    marker.formatted_address = 'Cannot determine address at this location.';
                }
                // infowindow.setContent(marker.formatted_address + "<br>coordinates: " + marker.getPosition().toUrlValue(6));
                alert(marker.getPosition().geocodeAddress);
                //infowindow.open(map, marker);
            });
        }

        infowindow = new google.maps.InfoWindow({
            size: new google.maps.Size(150, 50)
        });

    </script>
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAh6fWrqkQI3rK3uJXGbCgPXBt-ntStwpI&callback=initMap">
    </script>
</body>

</html>
