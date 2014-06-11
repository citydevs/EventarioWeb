
function initialize() {
var myLatlng = new google.maps.LatLng(19.437917441104343,-99.12730288354493);
var punto= new google.maps.LatLng(document.getElementById("lat").innerText,document.getElementById("lon").innerText); 
console.log(document.getElementById("lat").innerText);
var myOptions = {
  zoom: 15,
  center: punto,
  mapTypeId: google.maps.MapTypeId.ROADMAP,

}
var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
 
marker = new google.maps.Marker({
        position: punto,
        map: map,
        title: 'Default Marker',
        draggable:false,
      icon: {
        url: '/pin.png'
      }
});

  var f1 = document.getElementById("hi").innerText.substring(11)
  f1=f1.replace("UTC","");
  var f2 = document.getElementById("hf").innerText.substring(11)
  f2=f2.replace("UTC","");
 console.log(f1);
  console.log(f2);
  var a=f1 + "-"+f2;
    $("#horas").text(a);


  }

  $(document).ready(function(){ initialize()})
