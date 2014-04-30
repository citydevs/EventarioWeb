class Evento < ActiveRecord::Base
	validates :nombre, presence: true
	validates :lugar, presence: true
	validates :hora_inicio, presence: true
	validates :hora_fin, presence: true
	validates :direccion, presence: true
	validates :descripcion, presence: true
	validates :precio, presence: true
	validates :fuente, presence: true
	validates :fecha_inicio, presence: true
	validates :fecha_fin, presence: true
	validates :categoria, presence: true
	validates :contacto, presence: true
	validates :pagina, presence: true
	validates :latitud, presence: true
	validates :longitud, presence: true
end
