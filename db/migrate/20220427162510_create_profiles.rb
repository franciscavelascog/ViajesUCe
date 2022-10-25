class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :description
      t.string :email
      t.string :work
      t.integer :age
      t.string :photo

      t.timestamps
    end
  end
end
