class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :nombre
      t.string :direccion
      t.float :latitud
      t.float :longitud

      t.timestamps
    end
  end
end
