<?php
     	date_default_timezone_set('America/Mexico_City');
        
        $fecha_peticion= date("Y-m-d");
        $mes= date("m");
        if ($mes =="01") {
        	$mes= "1";
        }elseif ($mes =="02") {
        	$mes ="2";
        }elseif ($mes =="03") {
        	$mes ="3";
        }elseif ($mes =="04") {
        	$mes ="4";
        }elseif ($mes =="05") {
        	$mes ="5";
        }elseif ($mes =="06") {
        	$mes ="6";
        }elseif ($mes =="07") {
        	$mes ="7";
        }elseif ($mes =="08") {
        	$mes ="8";
        }elseif ($mes =="09") {
        	$mes ="9";
        }
        $fecha='20'.date("y")."-".$mes."-".date("d").'';
        
        
 //http://www.timeoutmexico.mx/df/search?language=es_419&order=date&page=1&page_size=50&nodes%5B1%5D=637&date=2014-03-13&_section_search=&section=
$url= "http://www.mexicoescultura.com/webservices/mxcult-calendario-fec.php?fecha_i=".$fecha."&lan=mx&tipo=json&cveapp=a309f9d87420e807ae798bf8a93649b2&ciu=1&fecha_f=".$fecha;

$xmlData=file_get_contents($url);
//$xmlData = file_get_contents('http://www.timeoutmexico.mx/df/search.json?language=es_419&order=date&page=2&nodes%5B1%5D=637&source=admin&_section_search=&section=&date=de$
$eventos=array();
//print("<pre>");
$resultados = json_decode($xmlData);

foreach($resultados as $evento) {

$categorias1 = explode(",", $evento->TEMAS_ACT);
if ($categorias1[0]=="5"||$categorias1[0]=="9"||$categorias1[0]=="13"||$categorias1[0]=="17"||$categorias1[0]=="19"||$categorias1[0]=="7"||$categorias1[0]=="15"||$categorias1[0]=="22"||$categorias1[0]=="24") {
$objeto=array();

$objeto["nombre"]=str_replace('&quot;', '', $evento->TITULO_PROGRAMA_ACT);
$objeto["lugar"]=$evento->NOMBRE_EC;
$objeto["direccion"]=$evento->DOMICILIO_EC;
$objeto["imagen"]=$evento->IMG_THUMB_ACT;



$pieces = explode(",", $evento->FECHA_HORA_ARR);

$objeto["fecha_inicio"]=$pieces[0];
//$objeto["cuantos"]=count($pieces);
if (count($pieces)>5) {
	$objeto["fecha_fin"]=trim($pieces[count($pieces)-4]);
    $horas=explode("|", trim($pieces[4]));
    $objeto["hora_fin"]=$horas[0];
}
else{
$objeto["fecha_fin"]=trim($pieces[1]);
$objeto["hora_fin"]=trim($pieces[4]);
}
$objeto["hora_inicio"]=trim($pieces[3]);


$url2="http://www.mexicoescultura.com/webservices/mxcult-det-actividad.php?id=".$evento->ID_ACT."&cveapp=a309f9d87420e807ae798bf8a93649b2&lan=mx&tipo=json";
$xmlData2=file_get_contents($url2);

$desc = json_decode($xmlData2);

foreach($desc as $datas) {
$objeto["descripcion"]=$datas->RESENA_ACT_TEXT;
}

$categorias = explode(",", $evento->TEMAS_ACT);
if ($categorias[0]=="5") {
$objeto["categoria"]="Cine";
}
elseif ($categorias[0]=="9") {
    $objeto["categoria"]="Exposiciones";
}
elseif ($categorias[0]=="13") {
    $objeto["categoria"]="Infantiles";
}
elseif ($categorias[0]=="19" || $categorias[0]=="7" || $categorias[0]=="15") {
    $objeto["categoria"]="Cultura";
}
elseif ($categorias[0]=="17") {
    $objeto["categoria"]="Música";
}
elseif ($categorias[0]=="22") {
    $objeto["categoria"]="Teatro";
}
elseif ($categorias[0]=="24") {
    $objeto["categoria"]="Aprendizaje";
}
else{
 $objeto["categoria"]="nada";

}

  
$objeto["fuente"]="CONACULTA";


$objeto["latitud"]=floatval( $evento->LATITUD_GMAPS);
$objeto["longitud"]=floatval($evento->LONGITUD_GMAPS);





$url3='http://www.mexicoescultura.com/consulta_detalle.php?actividad='.$evento->ID_ACT.'&tipo=xml&tabla=A&tipo_tema=A&lan=mx';

if (($response_xml_data = file_get_contents($url3))===false){
    echo "Error fetching XML\n";
} else {
   libxml_use_internal_errors(true);
   $data = simplexml_load_string($response_xml_data);
   if (!$data) {
       echo "Error loading XML\n";
         $objeto["pagina"]="No disponible";
   $objeto["contacto"]="No disponible";
       foreach(libxml_get_errors() as $error) {
           echo "\t", $error->message;
       }
   } else {

    
   $objeto["pagina"]="".$data->actividad->URL_ACT."";
   $objeto["contacto"]="".$data->actividad->INFORMES_ACT."";
   $objeto["precio"]="No disponible";
   $costo = explode("<br />", $data->actividad->FECHA_HORA_ACT);


        foreach ($costo as $key ) {
          $null= is_null($key);

          if ($key!="" || $key!=$null) {
            # code...
          
        $mystring = $key;
        $findme   = '$';
        $findme2   = 'Entrada libre';
        $findme3   = 'entrada libre';
        $findme4   = 'Entrada gratuita';
        $pos = strpos($mystring, $findme);
        $pos2 = strpos($mystring, $findme2);
        $pos3 = strpos($mystring, $findme3);
        $pos4 = strpos($mystring, $findme4);
        if ($pos !== false || $pos2!==false || $pos3!==false || $pos4!==false) {
             $objeto["precio"]= $key;
                
        } 


        }
        }


     
     // echo "\nadsdasd".$data->actividad->FECHA_HORA_ACT;
   }
}

if ($objeto["pagina"]=="null" ) {
  $objeto["pagina"]="No disponible";
 
}
/*if ($objeto["precio"]=="null" ) {
  $objeto["precio"]="No disponible";
 
}*/
if ($objeto["contacto"]=="null" ) {
  $objeto["contacto"]="No disponible";
 
}

$ch = curl_init();
$query="evento[nombre]=". $objeto["nombre"]."&evento[lugar]=".$objeto["lugar"]."&evento[direccion]=".$objeto["direccion"]."&evento[imagen]=".$objeto["imagen"]."&evento[fecha_inicio]=".$objeto["fecha_inicio"]."&evento[fecha_fin]=".$objeto["fecha_fin"]."&evento[hora_inicio]=".$objeto["hora_inicio"]."&evento[hora_fin]=".$objeto["hora_fin"]."&evento[descripcion]=".html_entity_decode($objeto["descripcion"])."&evento[categoria]=".$objeto["categoria"]."&evento[fuente]=".$objeto["fuente"]."&evento[latitud]=".$objeto["latitud"]."&evento[longitud]=".$objeto["longitud"]."&evento[pagina]=".$objeto["pagina"]."&evento[contacto]=".$objeto["contacto"]."&evento[precio]=".$objeto["precio"];
echo $objeto["descripcion"] ."<pre></pre>";
curl_setopt($ch, CURLOPT_URL,"http://localhost:3000/eventos.json");
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS,$query);

// in real life you should use something like:
// curl_setopt($ch, CURLOPT_POSTFIELDS, 
//          http_build_query(array('postvar1' => 'value1')));

// receive server response ...
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

$server_output = curl_exec ($ch);

curl_close ($ch);

// further processing ....
if ($server_output == "OK") { echo "si"; } else {  echo "no"; }
array_push($eventos, $objeto);



}}


 echo json_encode($eventos);

?>



