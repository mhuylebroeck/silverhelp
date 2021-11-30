class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @help_request = HelpRequest.find(params[:help_request_id])
  end

  def create
    @review = Review.new(review_params)
    @review.help_request_id = params[:help_request_id]
    @help_request = HelpRequest.find(params[:help_request_id])
    if @review.save
      @help_request.status = 3
      @help_request.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:friendliness_rating, :efficiency_rating,
                                   :punctuality_rating, :recommend, :description)
  end
end
