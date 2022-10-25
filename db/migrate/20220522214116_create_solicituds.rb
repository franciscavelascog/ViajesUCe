class CreateSolicituds < ActiveRecord::Migration[6.0]
  def change
    create_table :solicituds do |t|
      t.references :user, null: false, foreign_key: true
      t.references :publication, null: false, foreign_key: true
      t.string :status
      t.timestamps
    end
    add_index :solicituds, [:user_id, :publication_id], unique: true
  end
end
