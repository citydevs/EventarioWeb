# == Schema Information
#
# Table name: eventos
#
#  id           :integer          not null, primary key
#  nombre       :string(255)
#  lugar        :string(255)
#  hora_inicio  :time
#  hora_fin     :time
#  hora         :string(255)
#  descripcion  :text
#  precio       :string(255)
#  direccion    :string(255)
#  fuente       :string(255)
#  fecha_inicio :date
#  fecha_fin    :date
#  categoria    :string(255)
#  contacto     :string(255)
#  pagina       :string(255)
#  latitud      :float
#  longitud     :float
#  created_at   :datetime
#  updated_at   :datetime
#

class Evento < ActiveRecord::Base
  extend FriendlyId
  friendly_id :nombre, use: :slugged
  reverse_geocoded_by :latitud, :longitud
  validates :nombre, presence: true, uniqueness: true

  attr_reader :distancia

  def distancia=(val)
    @distancia = val.round(2)
  end

  def quitar_fecha
    puts hora_inicio = 0
    self.hora_inicio = 0
    a.save!
  end

  def self.pasando_hoy
    Evento.where("? >= fecha_inicio AND ? <= fecha_fin", Date.today, Date.today)
  end

end
