console.log("fasdfasd");
$.get(
    "eventos.json",
   
    function(data) {
       //alert('page content: ' + data[0].nombre);
     // $(".evento1")=data[0].nombre;
     var a=Math.floor((Math.random() * 10) + 1);
     var b=Math.floor((Math.random() * 30) + 11);
     var c=Math.floor((Math.random() * 40) + 31);
         var datos="<div class='col-md-1'></div><div class='col-md-3 boxpopular'>" +
        "<pre class='espacio'></pre><img src='"+data[a].imagen+"' width='40%' class='img-responsive center-block '><pre class='espacio'></pre>"+
        "<a href='"+data[a].url+"'><font color='#FFFFFF'>" + data[a].nombre + "</font></a></div><div class='col-md-1'></div>"+"<div class='col-md-3 boxpopular'>" +
        "<pre class='espacio'></pre><img src='"+data[b].imagen+"' width='40%' class='img-responsive center-block '><pre class='espacio'></pre>"+
        "<a href='"+data[b].url+"'><font color='#FFFFFF'>" + data[b].nombre + "</font></a></div><div class='col-md-1'></div>"+"<div class='col-md-3 boxpopular'>" +
        "<pre class='espacio'></pre><img src='"+data[c].imagen+"' width='40%' class='img-responsive center-block '><pre class='espacio'></pre>"+
        "<a href='"+data[c].url+"'><font color='#FFFFFF'>" + data[c].nombre + "</font></a></div><div class='col-md-1'></div>";
      console.log(Math.floor(Math.random() * (15-25+1)) + 25);

      $("#populares").html(datos);
    }
);

 