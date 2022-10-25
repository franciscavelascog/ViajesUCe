class AddHoraToPublications < ActiveRecord::Migration[6.0]
  def change
    add_column :publications, :hora, :time
  end
end
