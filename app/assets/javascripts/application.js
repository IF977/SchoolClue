// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

var map = new google.maps.Map(document.getElementById('map'), {
  center: {lat: -8.0414907, lng: -34.9374052},
  scrollwheel: false,
  zoom: 12,
  streetViewControl: false,
  scrollwheel: true,
  disableDefaultUI: true
});
map.data.setStyle({visible: false});
// click mouse on map tp get lat and long        
google.maps.event.addListener(map, "click", function(event) {
    document.getElementById("latitude").value = event.latLng.lat();
    document.getElementById("longitude").value = event.latLng.lng(); 
    var lat = event.latLng.lat();
    var lng = event.latLng.lng();
});