console.log("fasdfasd");
$.get(
    "eventos.json",
   
    function(data) {
       alert('page content: ' + data[0].nombre);
     // $(".evento1")=data[0].nombre;
         
    }
);

$(document).ready(function() {
 return $.ajax({
      url: 'eventos.json',
      type: 'GET',
      
      success: function(response) {
        $('#id_message').html(response);
        console.log="ds";
        return $("#id_message").show();
        //console.log(data[0].nombre);
      },
      error: function(response) {
        console.log="dsee";
        $('#id_message').html(response);
        return $("#id_message").show();
      }
    });
  
});

