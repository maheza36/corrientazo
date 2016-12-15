
$(document).ready(function() {
    initMap();
});

// Note: This example requires that you consent to location sharing when
// prompted by your browser. If you see the error "The Geolocation service
// failed.", it means you probably did not give permission for the browser to
// locate you.
//var myLatLng = {lat: -25.363, lng: 131.044};
function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: -34.397, lng: 150.644},
    zoom: 15
  });

//var marker = new google.maps.Marker({});

//marker.addListener('click', function() {}
/*google.maps.event.addListener(marker, 'click', function(){
    /*map.setZoom(8);
    map.setCenter(marker.getPosition());*/
  /*  console.log('click de aca');
});*/

  var infoWindow = new google.maps.InfoWindow({map: map});

  // Try HTML5 geolocation.
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      console.log('position');
      console.log(pos);
      var myLatLng = pos;
      infoWindow.setPosition(pos);
      infoWindow.setContent('Location found.');
      map.setCenter(pos);

      console.log('true position');
      console.log(myLatLng);

      var marker = new google.maps.Marker({
      position: myLatLng,
      map: map,
      draggable:true,
      title:"Drag me!"
    });

    google.maps.event.addListener(marker, 'click', function(){
        console.log('clic en el marcador');
        openInfoWindow(marker);
      });

      function openInfoWindow(marker) {
          var markerLatLng = marker.getPosition();
          infoWindow.setContent([
              markerLatLng.lat(),
              markerLatLng.lng(),
          ].join(''));
          infoWindow.open(map, marker);
      }

    }, function() {
      handleLocationError(true, infoWindow, map.getCenter());
    });
  } else {
    // Browser doesn't support Geolocation
    handleLocationError(false, infoWindow, map.getCenter());
  }

}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(browserHasGeolocation ?
                        'Error: The Geolocation service failed.' :
                        'Error: Your browser doesn\'t support geolocation.');
}
