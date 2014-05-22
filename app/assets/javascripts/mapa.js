var card, clean_map, create_cards, create_marker, display_on_map, get_current_location, gm_init, infowindow, inicializa, load_all_points, load_from_position, loc_error, loc_success, moviendo_mapa, set_marker_map, submit_ajax_form;
var geocoder;
if (!navigator.geolocation) {
  console.log("No geoloc");
}

infowindow = new google.maps.InfoWindow({
  maxWidth: 300
});

window.markers = [];

window.infowindows = [];

window.current_points = [];

console.log("fasdfasd");

inicializa = function() {
   geocoder = new google.maps.Geocoder();
  return console.log("fasdfasdfasdasf");
};

$(document).ready(function() {
  console.log("poss");
  google.maps.event.addDomListener(window, "load", inicializa);
  window.map = gm_init();
  load_all_points(map);
  google.maps.event.addListener(map, 'dragend', moviendo_mapa);
  navigator.geolocation.getCurrentPosition(loc_success, loc_error);
  submit_ajax_form();
  return get_current_location();
});

gm_init = function() {
  var gm_center, gm_map_type, map_options, mapa_desc;
  gm_center = new google.maps.LatLng(19.49, -99.2033);
  mapa_desc = $('#mapa');
  gm_map_type = google.maps.MapTypeId.ROADMAP;
  map_options = {

    center: gm_center,
    zoom: 14,
     maxZoom: 14,
      minZoom: 13,
    mapTypeId: gm_map_type,panControl: true,
  panControlOptions: {
  position: google.maps.ControlPosition.RIGHT_TOP
},
zoomControl: false,
zoomControlOptions: {
  style: google.maps.ZoomControlStyle.LARGE,
  position: google.maps.ControlPosition.RIGHT_TOP
}
  };
  return new google.maps.Map(document.getElementById("mapa"), map_options);
};

loc_success = function(position) {
  var center, latitude, longitude;
  console.log("position disponible");
  latitude = position.coords.latitude;
  longitude = position.coords.longitude;
  center = new google.maps.LatLng(latitude, longitude);
  console.log(latitude, longitude);
  window.map.panTo(center);
  window.center_marker = new google.maps.Marker({
    position: center,
    map: window.map,
    icon: {
      url: 'marker.png'
    }
  });
  clean_map(window.map);
  return load_from_position(window.map, latitude, longitude);
};

loc_error = function(err) {
  return console.log("no position disponible");
};

load_all_points = function(map) {
  var callback;
  callback = function(data) {
    return display_on_map(data, map);
  };
  return $.get('eventos.json', {}, callback, 'json');
};

load_from_position = function(map, lat, lon) {
  var callback_to_map;
  callback_to_map = function(data) {
    return display_on_map(data, map);
  };
  return $.get('eventos.json', {
    lat: lat,
    lon: lon
  }, callback_to_map, 'json');
};

display_on_map = function(data, map) {
  var centro, _i, _len, _ref;
  console.log(data);
  set_marker_map(null);
  _ref = data
  for (_i = 0, _len = _ref.length; _i < _len; _i++) {
    centro = _ref[_i];
    create_marker(centro, map);
  }
  set_marker_map(map);
  console.log("total marcadores " + window.markers.length);
  return create_cards();
};

set_marker_map = function(map) {
  var marker, _i, _len, _ref, _results;
  _ref = window.markers;
  _results = [];
  for (_i = 0, _len = _ref.length; _i < _len; _i++) {
    marker = _ref[_i];
    console.log("marcador");
    _results.push(marker.setMap(map));
  }
  return _results;
};

create_marker = function(point, map) {
  var content_string, marker;
  content_string = '<div class="centro_info">' + '<div class="centro_encabezado">' + '<h3>' + point.nombre + '</h3>' + '</div>' + '<div class="centro_content"' + '<h4>Lugar:</h4>' + '<p><img src="donde.png" width="20" height="23" />' + point.lugar + '</p>' + '<h4> Dirección:</h4>' + '<p> <img src="donde.png" width="20" height="23" />' + point.direccion + '</p><p> <img src="hora.png" width="20" height="23" />'+ point.hora+'</p>' + '</div>' + '</div>';
  marker = new google.maps.Marker({
    position: new google.maps.LatLng(point.latitud, point.longitud),
    animation: google.maps.Animation.DROP,
    map: map,
    icon: {
      url: 'pin.png'
    }
  });
  window.markers.push(marker);
  window.current_points.push(point);
  return google.maps.event.addListener(marker, 'click', function() {
    infowindow.setContent(content_string);
    infowindow.open(map, this);
    return window.infowindows.push(infowindow);
  });
};

moviendo_mapa = function() {
  var centro_pos, distancia_centro;
  centro_pos = window.map.getCenter();
  distancia_centro = google.maps.geometry.spherical.computeDistanceBetween(centro_pos, window.center_marker.getPosition());
  console.log(distancia_centro + "metros");
  console.log(window.current_points);
  create_cards();
  if (distancia_centro > 500) {
    clean_map(window.map);
    window.center_marker.setMap(null);
    window.center_marker = null;
    load_from_position(window.map, centro_pos.lat(), centro_pos.lng());
    return window.center_marker = new google.maps.Marker({
      position: window.map.getCenter(),
      map: window.map,
      icon: {
        url: 'marker.png'
      }
    });
  }
};
localizar = function() {
        if(navigator.geolocation) {
navigator.geolocation.getCurrentPosition(geoSuccess, geoError);
        } else {
            alert("Geolocation is not supported by this browser.");
        }
   
};
function geoSuccess(position) {
    var lat = position.coords.latitude;
    var lng = position.coords.longitude;
    var centro_pos, distancia_centro;
  console.log( "buscando");
  create_cards();
    clean_map(window.map);
    window.center_marker.setMap(null);
    window.center_marker = null;
    gm_center = new google.maps.LatLng(lat, lng);
     window.map.panTo(gm_center);

     load_from_position(window.map,lat, lng);
    load_from_position(window.map, lat, lng);
    return window.center_marker = new google.maps.Marker({
      position: gm_center,
      map: window.map,

      icon: {
        url: 'marker.png'
      }
    });
   // alert("lat:" + lat + " lng:" + lng);
}
function geoError() {
    //alert("Geocoder failed.");
}
buscar_mapa = function() {
  var centro_pos;
  console.log( "buscando");
  create_cards();
    clean_map(window.map);
    window.center_marker.setMap(null);
    window.center_marker = null;
    gm_center = new google.maps.LatLng(19.41498, -99.177446);
     window.map.panTo(gm_center);

     load_from_position(window.map,19.41498, -99.177446);
    load_from_position(window.map, 19.41498, -99.177446);
    return window.center_marker = new google.maps.Marker({
      position: gm_center,
      map: window.map,

      icon: {
        url: 'marker.png'
      }
    });
  
};

clean_map = function(map) {
  console.log("borrando");
  console.log(window.markers);
  set_marker_map(null);
  window.markers = [];
  window.infowindows = [];
  return window.current_points = [];
};

create_cards = function() {
  var point, _i, _len, _ref, _results;
  $("#tarjetas div").remove();
  $(".space").remove();

  _ref = window.current_points;
  _results = [];
  for (_i = 0, _len = _ref.length; _i < _len; _i++) {
    point = _ref[_i];
    _results.push($("#tarjetas").append(card(point)));
  }
  return _results;
};

card = function(point) {
  var direccion_centro, div_card_centro, hacer_cita, horario_centro, nombre_centro, telefonos_centro;
  nombre_centro = "<h3  class='eventos_textos'><a href='"+point.url+"'><font color='#FFFFFF'>" + point.nombre + "</font></a></h3>";
  direccion_centro = "<p class='eventos_textos'>" +'<img src="donde.png" width="20" height="23" />'+ point.lugar + "</p>";
  horario_centro = "<p class='eventos_textos'>" + point.direccion + "</p>";
  telefonos_centro = "<p class='eventos_textos'>" +'<img src="hora.png" width="20" height="23" />'+ point.hora + "</p>";
  //hacer_cita = "<span class='card_cita'><a href='places/" + point.lugar + "'>Agenda una cita</a></span>";
  return div_card_centro = "<div class='col-md-12 box1'>"+"<div class='card'>" + nombre_centro + direccion_centro + horario_centro + telefonos_centro  + "</div></div><pre class='space'></pre>";
};

submit_ajax_form = function() {
  return $("#forma_busqueda").bind('ajax:success', function(evt, data, status, xhr) {
    clean_map(window.map);
    return display_on_map(data, map);
  });
};

get_current_location = function() {
  var mostrar_todos;
  mostrar_todos = function() {
    console.log("wooo");
    return navigator.geolocation.getCurrentPosition(success, error);
  };
  return $("#boton_todos").click(mostrar_todos);
};

get_Address=function () {

   console.log("direccion");
   var sAddress = document.getElementById("lugar").value + "Mexico, D.F.";
 console.log(sAddress);
  geocoder.geocode( { 'address': sAddress}, function(results, status) { 

if (status == google.maps.GeocoderStatus.OK) 
  {
  
   map.setCenter(results[0].geometry.location);
   // var marker = new google.maps.Marker({  map: map,  position: results[0].geometry.location });
    console.log(results[0].geometry.location.A);
    console.log(results[0].geometry.location.k);
    var centro_pos;
  console.log( "buscando");
  create_cards();
    clean_map(window.map);
    window.center_marker.setMap(null);
    window.center_marker = null;
    gm_center = new google.maps.LatLng(results[0].geometry.location.k, results[0].geometry.location.A);
     window.map.panTo(gm_center);

     load_from_position(window.map,results[0].geometry.location.k, results[0].geometry.location.A);
    load_from_position(window.map, results[0].geometry.location.k, results[0].geometry.location.A);
    return window.center_marker = new google.maps.Marker({
      position: gm_center,
      map: window.map,

      icon: {
        url: 'marker.png'
      }
    });
  }

   else{  alert("No encontramos el lugar que buscas :/ " + status);}
  });

}
 
