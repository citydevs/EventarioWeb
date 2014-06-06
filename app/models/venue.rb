class Venue < ActiveRecord::Base
validates :nombre, presence: true, uniqueness: true
searchkick autocomplete: ['nombre']
validates :direccion, presence: true
validates :latitud, presence: true
validates :longitud, presence: true
end
