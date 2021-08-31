class RemoveUserReferencesFromVenues < ActiveRecord::Migration[6.0]
  def change
    remove_reference :venues, :user, null: false, foreign_key: true
  end
end
