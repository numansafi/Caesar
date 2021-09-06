class Venue < ApplicationRecord
  VENUE_TYPES = ["Indian", "Italian", "Chinese","Thai","Mexican","American"].freeze

  VENUE_ATTRIBUTES = ["Outdoor Space", "Disabled Toilets", "Disabled Access", "Disabled Parking", "Accommodating Staff", "Flexible Menu", "Dim Lighting", "Large Interior Space", "No Music", "Not Crowded", "Multiple Exits","No Strong Smells","Activities For Children","Mostly Families", "Outside Food Allowed"].freeze

  has_many :reviews
  acts_as_taggable_on :venue_types
  acts_as_taggable_on :venue_attributes

  include PgSearch::Model
    pg_search_scope :search_by,
      against: [ [:name, 'A'], [:address, 'B'], [:venue_type, 'D'], [:venue_attribute, 'C']],
      associated_against: {
        venue_attributes: [:name],
        venue_types: [:name]
      },
      using: {
        tsearch: { any_word: true }
      }

end
