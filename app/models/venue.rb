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
    def icon
      case venue_attribute
      when "Outdoor Space"
        '<i class="fas fa-tree"></i>'
      when "Disabled Toilets"
        '<i class="fas fa-toilet"></i>'
      when "Disabled Access"
        '<i class="fas fa-wheelchair"></i>'
      when "Disabled Parking"
        '<i class="fas fa-parking"></i>'
      when "Accommodating Staff"
        '<i class="fas fa-smile-beam"></i>'
      when "Flexible Menu"
        '<i class="fas fa-pizza-slice"></i>'
      when "Dim Lighting"
        '<i class="fas fa-lightbulb"></i>'
      when "Large Interior Space"
        '<i class="fas fa-people-arrows"></i>'
      when "No Music"
        '<i class="fas fa-volume-mute"></i>'
      when "Not Crowded"
        '<i class="fas fa-users-slash"></i>'
      when "Multiple Exits"
        '<i class="fas fa-door-open"></i>'
      when "No Strong Smells"
        '<i class="fas fa-wind"></i>'
      when "Activities For Children"
        '<i class="fas fa-child"></i>'
      when "Mostly Families"
        '<i class="fas fa-baby"></i>'
      when "Outside Food Allowed"
        '<i class="fas fa-shopping-bag"></i>'
      else
        ""
      end
    end
end
