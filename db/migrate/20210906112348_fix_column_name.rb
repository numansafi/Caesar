class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :venues, :venue_attributes, :venue_attribute
  end
end
