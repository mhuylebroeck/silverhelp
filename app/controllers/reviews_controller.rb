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
      review_avg = (@review.friendliness_rating + @review.efficiency_rating + @review.punctuality_rating).to_f / 3
      if review_avg > 4
        @help_request.helper.points_balance += @help_request.duration * 20
      elsif review_avg > 3
        @help_request.helper.points_balance += @help_request.duration * 15
      elsif review_avg > 2
        @help_request.helper.points_balance += @help_request.duration * 10
      else
        @help_request.helper.points_balance += @help_request.duration * 1
      end
      @help_request.helper.save
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
