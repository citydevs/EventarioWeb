class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.string :nombre
      t.string :lugar
      t.datetime :hora_inicio
      t.datetime :hora_fin
      t.string :hora
      t.text :descripcion
      t.string :precio
      t.string :direccion
      t.string :fuente
      t.date :fecha_inicio
      t.date :fecha_fin
      t.string :categoria
      t.string :contacto
      t.string :pagina
      t.float :latitud
      t.float :longitud

      t.timestamps
    end
  end
end
