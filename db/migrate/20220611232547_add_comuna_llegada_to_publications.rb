class AddComunaLlegadaToPublications < ActiveRecord::Migration[6.0]
  def change
    add_column :publications, :comuna_llegada, :string
  end
end
