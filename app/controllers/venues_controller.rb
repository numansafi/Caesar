class VenuesController < ApplicationController
  before_action :set_venue, only: [:show]

  def index
    @venues = Venue.all
  end

  def show
  end

  private

  def set_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:name, :description, :address, :venue_type, :venue_attributes)
  end

end
