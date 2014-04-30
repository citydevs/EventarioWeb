json.array!(@eventos) do |evento|
  json.extract! evento, :nombre, :lugar, :hora_inicio, :hora_fin, :hora, :descripcion, :precio, :direccion, :fuente, :fecha_inicio, :fecha_fin, :categoria, :contacto, :pagina, :latitud, :longitud
  json.url evento_url(evento, format: :json)
end
