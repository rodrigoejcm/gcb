class AddImageToEventos < ActiveRecord::Migration[5.0]
  def change
    add_column :eventos, :image, :string
  end
end
