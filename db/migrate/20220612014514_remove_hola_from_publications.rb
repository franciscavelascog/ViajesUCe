class RemoveHolaFromPublications < ActiveRecord::Migration[6.0]
  def change
    remove_column :publications, :hola, :string
  end
end
