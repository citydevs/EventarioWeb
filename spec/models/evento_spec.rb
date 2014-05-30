require 'spec_helper'

describe Evento do

  before do
    @evento = Evento.new(nombre: "Evento1")
  end

  subject { @evento}

  it { should respond_to(:nombre)}


end
