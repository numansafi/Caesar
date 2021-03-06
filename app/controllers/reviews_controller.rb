class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :show, :update, :destroy]
  before_action :set_venue, only: [:new, :show, :create, :edit, :index ]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.venue = @venue
    @review.user = current_user
    if @review.save
      redirect_to venue_path(@venue)
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
    @venue = Venue.find(params[:venue_id])
  end

  def review_params
    params.require(:review).permit(:rating, :description)
  end
end
