class AddVenueIdToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :venue_id, :integer
  end
end
