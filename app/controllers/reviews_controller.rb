class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_venue, only: [:new, :create, :edit, :index ]

  def index
    @reviews = Review.all
  end

  # don't need show page for reviews, as edit/see these on venue show page
  # def show
  # end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(booking_params)
    @review.venue = @venue
    @review.user = current_user
    if @review.save
      redirect to venue_path(@venue)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @review.update(review_params)
    redirect_to venue_path(@venue)
  end

  def destroy
    @review.destroy
    redirect_to venue_path(@venue)
  end

  def my_reviews
    @reviews = Review.where(user: current_user)
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:rating, :description)
  end
end
