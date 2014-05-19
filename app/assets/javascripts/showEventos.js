
function initialize() {
var myLatlng = new google.maps.LatLng(19.437917441104343,-99.12730288354493);

var myOptions = {
  zoom: 15,
  center: myLatlng,
  mapTypeId: google.maps.MapTypeId.ROADMAP,

}
var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
 
marker = new google.maps.Marker({
        position: myLatlng,
        map: map,
        title: 'Default Marker',
        draggable:true,
      icon: {
        url: '/pin.png'
      }
});





  }

  $(document).ready(function(){ initialize()})
