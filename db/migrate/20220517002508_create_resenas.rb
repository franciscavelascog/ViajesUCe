class CreateResenas < ActiveRecord::Migration[6.0]
  def change
    create_table :resenas do |t|
      t.integer :user_id
      t.integer :puntualidad
      t.integer :seguridad
      t.string :comentario
      t.timestamps
    end
  end
end
