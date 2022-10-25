class AddComunaPartidaToPublications < ActiveRecord::Migration[6.0]
  def change
    add_column :publications, :comuna_partida, :string
  end
end
