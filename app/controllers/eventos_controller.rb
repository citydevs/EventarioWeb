require "net/http"
class EventosController < ApplicationController
  before_action :set_evento, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, only: [:edit, :new]

  # GET /eventos
  # GET /eventos.json
  def index
    @eventos = Evento.all
  end

  # GET /eventos/1
  # GET /eventos/1.json
  def show
  end

  # GET /eventos/new
  def new
    @evento = Evento.new
  end

  # GET /eventos/1/edit
  def edit
  end

  # POST /eventos
  # POST /eventos.json
  def create
    @evento = Evento.new(evento_params)

    respond_to do |format|
      if @evento.save
        format.html { redirect_to @evento, notice: 'Evento was successfully created.' }
        format.json { render action: 'show', status: :created, location: @evento }
      else
        format.html { render action: 'new' }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventos/1
  # PATCH/PUT /eventos/1.json
  def update
    respond_to do |format|
      if @evento.update(evento_params)
        format.html { redirect_to @evento, notice: 'Evento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventos/1
  # DELETE /eventos/1.json
  def destroy
    @evento.destroy
    respond_to do |format|
      format.html { redirect_to eventos_url }
      format.json { head :no_content }
    end
  end
  def mapa
    if params.has_key?(:latitud) && params.has_key?(:longitud)
      puts params[:latitud]
      response=Net::HTTP.get_response('codigo.labplc.mx','/~rockarloz/dejatecaer/dejatecaer.php?longitud='+params[:longitud]+'&latitud='+params[:latitud]+'&radio=2000')


    else
    response=Net::HTTP.get_response('codigo.labplc.mx','/~rockarloz/dejatecaer/dejatecaer.php?longitud=-99.13330667&latitud=19.42342714&radio=2000')

    end
    respond_to do |f|
      f.html
      f.json { render json: response.body }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento
      @evento = Evento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evento_params
      params.require(:evento).permit(:nombre, :lugar, :hora_inicio, :hora_fin, :hora, :descripcion, :precio, :direccion, :fuente, :fecha_inicio, :fecha_fin, :categoria, :contacto, :pagina, :latitud, :longitud)
    end
end
