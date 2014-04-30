require 'test_helper'

class EventosControllerTest < ActionController::TestCase
  setup do
    @evento = eventos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eventos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create evento" do
    assert_difference('Evento.count') do
      post :create, evento: { categoria: @evento.categoria, contacto: @evento.contacto, descripcion: @evento.descripcion, direccion: @evento.direccion, fecha_fin: @evento.fecha_fin, fecha_inicio: @evento.fecha_inicio, fuente: @evento.fuente, hora: @evento.hora, hora_fin: @evento.hora_fin, hora_inicio: @evento.hora_inicio, latitud: @evento.latitud, longitud: @evento.longitud, lugar: @evento.lugar, nombre: @evento.nombre, pagina: @evento.pagina, precio: @evento.precio }
    end

    assert_redirected_to evento_path(assigns(:evento))
  end

  test "should show evento" do
    get :show, id: @evento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @evento
    assert_response :success
  end

  test "should update evento" do
    patch :update, id: @evento, evento: { categoria: @evento.categoria, contacto: @evento.contacto, descripcion: @evento.descripcion, direccion: @evento.direccion, fecha_fin: @evento.fecha_fin, fecha_inicio: @evento.fecha_inicio, fuente: @evento.fuente, hora: @evento.hora, hora_fin: @evento.hora_fin, hora_inicio: @evento.hora_inicio, latitud: @evento.latitud, longitud: @evento.longitud, lugar: @evento.lugar, nombre: @evento.nombre, pagina: @evento.pagina, precio: @evento.precio }
    assert_redirected_to evento_path(assigns(:evento))
  end

  test "should destroy evento" do
    assert_difference('Evento.count', -1) do
      delete :destroy, id: @evento
    end

    assert_redirected_to eventos_path
  end
end
