ActiveAdmin.register Evento do


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  permit_params :nombre, :lugar, :hora_inicio, :hora_fin, :imagen, :descripcion, :precio, :fuente, :fecha_inicio, :fecha_fin, :categoria, :contacto, :pagina, :latitud, :longitud

  before_filter :only => [:show] do
    @evento= Evento.friendly.find(params[:id])
  end

  form :partial => "form"

end
