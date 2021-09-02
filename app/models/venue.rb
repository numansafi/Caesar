class Venue < ApplicationRecord
  has_many :reviews

  include PgSearch::Model
    pg_search_scope :search_by,
      against: [ [:name, 'A'], [:address, 'B'], [:venue_type, 'D'], [:venue_attributes, 'C']],
      using: {
        tsearch: { prefix: true }
      }

end
