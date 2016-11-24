class ReviewsController < ApplicationController
  before_action :set_user

    def new
      @review = Review.new
    end

    def create
      @review = Review.new(review_params)
      @review.user = @user
      if @review.save
        redirect_to user_path(@user)
      else
        render :new
      end
    end

    private

    def review_params
      params.require(:review).permit(:content, :star)
    end

    def set_user
      @user = User.find(params[:user_id, :meeting_id])
    end
  end
