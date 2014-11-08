require "net/http"
class EventosController < ApplicationController
  before_action :set_evento, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  skip_authorize_resource :only => :create
  before_action :authenticate_user!, only: [:edit, :new]


  # GET /eventos
  # GET /eventos.json
  def index
    puts params[:categorias]
    respond_to do |format|
      format.html { @eventos = Evento.all.paginate(page: params[:page], per_page: 10)}
      format.json {
        if params[:lat] || params[:lon]
          distancia = params[:dist] ||= 1
          @eventos = Evento.where(nil)
          if params[:fecha].present?
            @eventos = @eventos.pasando_en(params[:fecha]).near([params[:lat], params[:lon]], distancia,{ units: :km})
          else
            @eventos = @eventos.pasando_hoy.near([params[:lat], params[:lon]], distancia,{ units: :km})
          end
          @eventos = @eventos.by_category(params[:categorias].map(&:downcase)) if params[:categorias].present?
          @eventos.each do |evento|
            evento.distancia = evento.distance_to([params[:lat], params[:lon]], :km)
          end
        else
          @eventos = Evento.where(nil)
          if params[:fecha].present?
            @eventos = Evento.pasando_en(params[:fecha]) 
          else
            @eventos = Evento.pasando_hoy
          end
          @eventos = @eventos.by_category(params[:categorias].map(&:downcase)) if params[:categorias].present?
        end

      }
    end

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
        format.html { redirect_to @evento, notice: 'Evento creado correctamente.' }
        format.json { render action: 'show', status: :created, location: @evento }
      else
        format.html { render action: 'new' }
        format.json do
          puts @evento.errors
          puts "LALALAL"
          render json: @evento.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /eventos/1
  # PATCH/PUT /eventos/1.json
  def update
    respond_to do |format|
      if @evento.update(evento_params)
        format.html { redirect_to @evento, notice: 'Evento actualizado correctamente.' }
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
      response=Net::HTTP.get_response('codigo.labplc.mx','/~rockarloz/dejatecaer/dejatecaer.php?longitud='+params[:longitud]+'&latitud='+params[:latitud]+'&radio=2')


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
      @evento = Evento.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evento_params
      params.require(:evento).permit(:nombre, :lugar, :hora_inicio, :hora_fin, :imagen, :descripcion, :precio, :direccion, :fuente, :fecha_inicio, :fecha_fin, :categoria, :contacto, :pagina, :latitud, :longitud)
    end
end
