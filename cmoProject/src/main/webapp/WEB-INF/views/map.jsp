<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
<head>
<title>3003 maps v9</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<style>
#map {
	height: 400px;
	width: 100%;
}
</style>
</head>
<body>


	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBDiT4KVHOVMfzURpGA_hfEbN2NF7D_3v0&libraries=geometry"
		type="text/javascript"></script>
	<div id="json">
		<p txt="demo.txt"></p>
	</div>
	<div id="map">
		<script>
			//for obtaining coordinates

			var inputCoord = '{"x1":1.2859963, "x2":1.3017996, "x3":1.2545582, "y1":103.85016080000003, "y2":103.83779709999999, "y3":103.81477870000003}';
			var coordinates = JSON.parse(inputCoord);
			var p1 = new google.maps.LatLng(coordinates.x1, coordinates.y1);
			var p2 = new google.maps.LatLng(coordinates.x2, coordinates.y2);
			var p3 = new google.maps.LatLng(coordinates.x3, coordinates.y3);
			var centerX = (coordinates.x1 + coordinates.x2 + coordinates.x3) / 3;
			var centerY = (coordinates.y1 + coordinates.y2 + coordinates.y3) / 3;
			var centerP = new google.maps.LatLng(centerX, centerY);
		</script>


		<script>
			var map;
			var markers = [];
			var iconFolder = "${pageContext.request.contextPath}/resources/img/";

			function initMap() {// for initialization of map
				/*
				initial map: first 3 coordinates with default circle and radius
				 *///map options
				var options = {
					zoom : 12,
					center : {
						lat : 1.30416545,
						lng : 103.824080037
					},
					mapTypeID : 'terrain'
				};
				map = new google.maps.Map(document.getElementById('map'),
						options);

				//this array specify the default markers loaded when map starts
				var initialMarkers = [ {//1
					coords : p1,
					content : 'Boat Quay'
				}, {//2
					coords : p2,
					content : 'Orchard Road'
				}, {//3
					coords : p3,
					content : 'Sentosa Siloso Beach'
				} ]; // this array of markers sets the default locations, can be stored in a DB
				// can create a form to pass in the marker parameters from the database
				// param: coords, iconImage, content
				//loop through markers
				for (var i = 0; i < initialMarkers.length; i++) {
					//add markers
					addMarker(initialMarkers[i]);
				}

				//Global default marker listener
				//add a listener to listen for click events on map
				google.maps.event.addListener(map, 'click', function(event) {
					//add marker
					addMarker({
						coords : event.latLng
					});
				});
				//end of listener		

				var centerMarker = new google.maps.Marker(
						{
							position : centerP,
							icon : 'http://maps.google.com/mapfiles/ms/icons/green-dot.png',
							map : map
						});
				var AOE = new google.maps.Circle({
					map : map,
					radius : 4000,
					fillColor : '#0000ff'
				});
				AOE.bindTo('center', centerMarker, 'position');

			} //end of initMap

			//add marker function - global
			function addMarker(props) {
				//add marker
				var marker = new google.maps.Marker({
					position : props.coords,
					map : map
				});
				//check for custom icon - still under addMarker function
				if (props.iconImage) {
					//set icon image
					marker.setIcon(props.iconImage);
				}
				//check content - still under addMarker2 function
				if (props.content) {
					var infoWindow = new google.maps.InfoWindow({
						content : props.content
					//it can also be some html
					});
					//add a listener to listen to the infowindow
					//parameter- click and a function tat opens the infowindow
					marker.addListener('click', function() {
						infoWindow.open(map, marker);
					});
				}
				markers.push(marker);
			}

			//functions for hide/show markers, delete markers 
			// Sets the map on all markers in the array.
			function setMapOnAll(map) {
				for (var i = 0; i < markers.length; i++) {
					markers[i].setMap(map);
				}
			}

			// Removes the markers from the map, but keeps them in the array.
			function clearMarkers() {
				setMapOnAll(null);
			}

			// Shows any markers currently in the array.
			function showMarkers() {
				setMapOnAll(map);
			}

			// Deletes all markers in the array by removing references to them.
			function deleteMarkers() {
				clearMarkers();
				markers = [];
			}
			function coordParse(affectedArea) {
				var array = null;
				var lat; //obtain lat as a numerical value
				var lng; //obtain lng as a numerical value

				array = affectedArea.split("/");
				lat = array[1];
				lng = array[2];

				var coordi = new google.maps.LatLng(lat, lng);

				return coordi;
			}
		</script>

	</div>


	<script>
		google.maps.event.addDomListener(window, 'load', initMap);
		google.maps.event.addDomListener(window, 'resize', initMap);
	</script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</body>

</html>
