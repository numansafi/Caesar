class VenuesController < ApplicationController
  before_action :set_venue, only: [:show]
  before_action :set_review, only: [:show]

  def index
    if params["query"].present?
      @filter = params["query"]["venue_type"].concat(params["query"]["venue_attribute"]).flatten.reject(&:blank?)
      @venues = Venue.all.search_by("#{@filter}")
    elsif params["search"].present?
      @venues = Venue.search_by(params[:search])
    else
      @venues = Venue.all
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
        @markers =
      {
        lat: @venue.latitude,
        lng: @venue.longitude
      }
  end

  def filters_explained
  end

  private

  def set_venue
    @venue = Venue.find(params[:id])
  end

  def set_review
    @review = Review.new
  end

  def venue_params
    params.require(:venue).permit(:name, :description, :address, :venue_type, :venue_attribute, :venue_type_list, :venue_attribute_list)
  end

end
