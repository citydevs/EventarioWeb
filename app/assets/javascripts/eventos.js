
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
window.map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
window.markers = []

marker = new google.maps.Marker({
        position: pin,
        map: map,
        title: 'Default Marker',
        draggable:true,
      icon: {
        url: '/pin.png'
      }
});

window.markers.push(marker);


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
document.getElementById("precio").style.visibility = "hidden";
document.getElementById("preciolbl").style.visibility = "hidden";
/*   $("#formaforma").blur(function() {
    console.log("sdasd");
   });*/
$("#op").change(function(){


    console.log(document.getElementById("op").value);
    if (document.getElementById("op").value=="Si") {

        $("#precio").val("Entrada Libre");
        document.getElementById("precio").style.visibility = "hidden";
        document.getElementById("preciolbl").style.visibility = "hidden";

    }
    else{

     $("#precio").val("")
     document.getElementById("precio").style.visibility = "visible";
     document.getElementById("preciolbl").style.visibility = "visible";

    }

  });

 })
/*
 auto=function () {

   //console.log(document.getElementById('formaforma').value );
   var str = document.getElementById('formaforma').value;
   var res = str.split("-");
   console.log(res);
   $("#uno").val(res[0]);
    $("#dos").val(res[1]);


}*/


$(document).ready(function() {
  $('#e1').select2({
    ajax: {
      url: '/venues',
      dataType: 'json',
      data: function(term, pag) {
        return {
          query: term,
          page: pag
        }
      },
       results: function (data, page) {
        var myResults = [];
            $.each(data, function (index, item) {
                myResults.push({
                    id: item.nombre,
                    text: item.nombre,
                    direccion: item.direccion,
                    lat: item.latitud,
                    lng: item.longitud
                });
            });
            return {
                results: myResults
            };
        }
    }
  });

  $('#e1').on('change', function(e) {
    console.log(e.added);
    $("#evento_direccion").val(e.added.direccion)
    document.getElementById('lat').value = e.added.lat;
        document.getElementById('lng').value = e.added.lng;
    clearMarkers()

    var pin1 = new google.maps.LatLng(e.added.lat,e.added.lng);
    window.map.panTo(pin1);
    marker = new google.maps.Marker({
        position: pin1,
        map: window.map,
        title: 'Default Marker',
        draggable:true,
      icon: {
        url: '/pin.png'
      }
});
  })
});

//coloca los markers del mapa
function setAllMap(map) {
  for (var i = 0; i < markers.length; i++) {
    window.markers[i].setMap(map);
  }
}

function clearMarkers() {
  setAllMap(null);
}




