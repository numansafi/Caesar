class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :edit, :update, :destroy ]
  before_action :set_venue, only: [:new, :create, :edit, :index ]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.venue = @venue
    @booking.user = current_user
    if @booking.save
      redirect to my_bookings_path
    else
      render :new
    end
  end

  def my_bookings
    @bookings = Booking.where(user: current_user)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_venue
    @venue = Venue.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date_time, :end_date_time, :number_of_people)
  end

end
