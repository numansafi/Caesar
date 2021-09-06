class Venue < ApplicationRecord
  has_many :reviews

  acts_as_taggable_on :venue_types
  acts_as_taggable_on :venue_attributes

  $venue_types = ["Indian", "Italian", "Chinese","Thai","Mexican","American"]
  $venue_attributes = ["Outdoor Space", "Disabled Toilets", "Disabled Access", "Disabled Parking", "Accommodating Staff", "Flexible Menu", "Dim Lighting", "Large Interior Space", "No Music", "Not Crowded", "Multiple Exits","No Strong Smells","Activities For Children","Mostly Families", "Outside Food Allowed"]

  include PgSearch::Model
    pg_search_scope :search_by,
      against: [ [:name, 'A'], [:address, 'B'], [:venue_type, 'D'], [:venue_attributes, 'C']],
      using: {
        tsearch: { prefix: true }
      }

end
