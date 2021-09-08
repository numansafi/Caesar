class AddImageColumnToVenues < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :image, :string
  end
end
