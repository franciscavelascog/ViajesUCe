class AddHolaToPublications < ActiveRecord::Migration[6.0]
  def change
    add_column :publications, :hola, :string
  end
end
