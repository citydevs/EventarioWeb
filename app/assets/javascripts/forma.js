

   $('#formaforma').datepick({
    rangeSelect: true, monthsToShow: 2, showTrigger: '#calImg'});


console.log("fasdfasd");
$.get(
    "https://api.foursquare.com/v2/venues/search?client_id=FDAPOJ2FCI2XGEQ0D5JJYXIA5M3WU332TRFN0YMDB0SIEUFN&client_secret=2GQPSIP3W5FA0KPGGUHEXTD2E20PY2HIP2FJLIT34FDQO0PG&v=20130815&ll=19.432602,-99.133205&query=museo&radius=15000",
   
    function(data) {
       //alert('page content: ' + data[0].nombre);
     // $(".evento1")=data[0].nombre;
    console.log(data);

    
    }
);



