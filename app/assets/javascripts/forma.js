
window.fecha = "";

   $('#formaforma').datepick({
    rangeSelect: true, 
    monthsToShow: 2, 
    showTrigger: '#calImg',
    onClose: function(dates){
      console.log(dates[0]);
      

     


  var str =dates[0].toJSON();
  var res = str.split("T");
  var strF=res[0];
  var resFecha1=strF.split("-");
  var fecha1=resFecha1[2]+"-"+resFecha1[1]+"-"+resFecha1[0];
   console.log(fecha1);
   $("#uno").val(fecha1);


   var str2 =dates[1].toJSON();
  var res2 = str2.split("T");
  var strF2=res2[0];
  var resFecha2=strF2.split("-");
  var fecha2=resFecha2[2]+"-"+resFecha2[1]+"-"+resFecha2[0];
    $("#dos").val(fecha2);
     
    }});


 cambio=function () {
alert('test');
  console.log("cambio");
    

}
 







