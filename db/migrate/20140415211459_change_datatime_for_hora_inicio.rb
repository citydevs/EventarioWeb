class ChangeDatatimeForHoraInicio < ActiveRecord::Migration
  def change
  change_column :eventos, :hora_inicio, :time
  change_column :eventos, :hora_fin, :time
  end
end
