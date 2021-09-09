class AddPhotosToVenues < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :photos, :string, array: true, default: []
  end
end
