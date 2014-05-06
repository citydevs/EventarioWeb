
function initialize() {
var myLatlng = new google.maps.LatLng(19.4232669,-99.134341);

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



google.maps.event.addListener(
    marker,
    'drag',
    function(event) {
        document.getElementById('lat').value = this.position.lat();
        document.getElementById('lng').value = this.position.lng();
        //alert('drag');
    });


google.maps.event.addListener(marker,'dragend',function(event) {
        document.getElementById('lat').value = this.position.lat();
        document.getElementById('lng').value = this.position.lng();
       // alert('Drag end');
    });


  }

  $(document).ready(function(){ initialize()})
