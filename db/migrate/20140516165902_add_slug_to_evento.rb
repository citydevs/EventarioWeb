class AddSlugToEvento < ActiveRecord::Migration
  def change
    add_column :eventos, :slug, :string
    add_index :eventos, :slug, unique: true
  end
end
