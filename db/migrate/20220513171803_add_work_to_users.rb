class AddWorkToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :work, :string
  end
end
