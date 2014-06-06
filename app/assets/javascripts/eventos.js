
function initialize() {
var myLatlng = new google.maps.LatLng(19.4232669,-99.134341);
//var punto= new google.maps.LatLng(document.getElementById("lat").value,document.getElementById("lon").value); 
var punto= document.getElementById("lat").value;
var punto2= document.getElementById("lng").value;
var pin = new google.maps.LatLng(punto,punto2);
if (punto=="") {
  pin=myLatlng;
};

console.log(punto + punto2);
var myOptions = {
  zoom: 15,
  center: pin,
  mapTypeId: google.maps.MapTypeId.ROADMAP,

}
var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

marker = new google.maps.Marker({
        position: pin,
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

    // $('#uno').keyup(function () { alert('test'); });
  //$('#formaforma').change(function () { alert('test'); });

  }

  $(document).ready(function(){
   initialize()

/*   $("#formaforma").blur(function() {
    console.log("sdasd");
   });*/


 })

 auto=function () {

   //console.log(document.getElementById('formaforma').value );
   var str = document.getElementById('formaforma').value;
   var res = str.split("-");
   console.log(res);
   $("#uno").val(res[0]);
    $("#dos").val(res[1]);
    

}
 
