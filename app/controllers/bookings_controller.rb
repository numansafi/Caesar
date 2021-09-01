class BookingsController < ApplicationController

  before_action :set_booking, only: [:edit, :update, :destroy]
  before_action :set_venue, only: [:new, :create, :edit]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.venue = @venue
    @booking.user = current_user
    if @booking.save
      # Path to go to user bookings page
      redirect_to my_bookings_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @venue.update(booking_params)
    # Path to go to user bookings page
    redirect_to my_bookings_path
  end

  def my_bookings
    # Takes user to their bookings
    @bookings = Booking.where(user: current_user)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_venue
    @venue = Venue.find(params[:venue_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date_time, :end_date_time, :number_of_people)
  end

end
