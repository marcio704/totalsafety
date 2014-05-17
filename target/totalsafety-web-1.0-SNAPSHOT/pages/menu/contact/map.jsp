<html>
    <head>
        <title>Simple Map</title>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
        <meta charset="utf-8">
        <style>
            html, body, #map-canvas {
                height: 100%;
                margin: 0px;
                padding: 0px
            }
        </style>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
        <script>
            function initialize() {
                var myLatlng = new google.maps.LatLng(-23.635598, -46.551003);

                var mapOptions = {
                    zoom: 15,
                    center: myLatlng,
                    zoomControl: true,
                    zoomControlOptions: {
                        style: google.maps.ZoomControlStyle.DEFAULT,
                    },
                    disableDoubleClickZoom: true,
                    mapTypeControl: true,
                    mapTypeControlOptions: {
                        style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
                    },
                    scaleControl: true,
                    scrollwheel: true,
                    streetViewControl: true,
                    draggable: true,
                    overviewMapControl: true,
                    overviewMapControlOptions: {
                        opened: true,
                    },
                };
                var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

                var marker = new google.maps.Marker({
                    position: myLatlng,
                    title: "Total Safety!"
                });

                // To add the marker to the map, call setMap();
                marker.setMap(map);
            }

            google.maps.event.addDomListener(window, 'load', initialize);

        </script>
    </head>
    <body>
        <div id="map-canvas"></div>
    </body>
</html>