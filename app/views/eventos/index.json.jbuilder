json.array!(@eventos) do |evento|
  json.extract! evento, :nombre, :lugar, :hora_inicio, :hora_fin, :imagen, :descripcion, :precio, :direccion, :fuente, :fecha_inicio, :fecha_fin, :categoria, :contacto, :pagina, :latitud, :longitud, :distancia
  json.url evento_url(evento, format: :html)
end
