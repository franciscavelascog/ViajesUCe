class CreatePublications < ActiveRecord::Migration[6.0]
  def change
    create_table :publications do |t|
      t.string :titulo
      t.string :punto_partida
      t.string :punto_llegada
      t.datetime :fecha
      t.integer :cupos
      t.float :radio

      t.timestamps
    end
  end
end
