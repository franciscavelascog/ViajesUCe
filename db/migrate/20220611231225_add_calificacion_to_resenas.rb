class AddCalificacionToResenas < ActiveRecord::Migration[6.0]
  def change
    add_column :resenas, :calif, :integer
  end
end
