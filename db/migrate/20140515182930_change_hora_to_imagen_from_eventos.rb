class ChangeHoraToImagenFromEventos < ActiveRecord::Migration
  def change
    rename_column :eventos, :hora, :imagen
  end
end
