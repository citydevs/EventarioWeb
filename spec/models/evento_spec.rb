# == Schema Information
#
# Table name: eventos
#
#  id           :integer          not null, primary key
#  nombre       :string(255)
#  lugar        :string(255)
#  hora_inicio  :time
#  hora_fin     :time
#  imagen       :string(255)
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
#  slug         :string(255)
#  venue_id     :integer
#

require 'spec_helper'

describe Evento do

  before do
    @evento = Evento.new(nombre: "Evento1")
  end

  subject { @evento}

  it { should respond_to(:nombre)}


end
