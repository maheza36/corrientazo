$(document).ready(function() {var marcadores_string = document.getElementById('map').getAttribute('data-gps');if(!marcadores_string){  return;}var marcadores = JSON.parse(marcadores_string);  var mapDiv = document.getElementById('map');  var catalunya = new google.maps.LatLng(41.652393,1.691895);  var options = {    center: new google.maps.LatLng(41.652393,1.691895),    zoom: 8,    mapTypeId: google.maps.MapTypeId.ROADMAP  };  map = new google.maps.Map(mapDiv, options);  for (var i = 0; i < marcadores.length; i++) {  var myLatLng = new google.maps.LatLng(marcadores[i][1], marcadores[i][2]);  var marker = new google.maps.Marker({  position: myLatLng,  map: map,  title: marcadores[i][0],  });}});