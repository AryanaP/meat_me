class ReviewsController < ApplicationController
  # before_action :set_user

    def new
      @user = Meeting.find(params[:meeting_id]).meal.user
      @meal = Meeting.find(params[:meeting_id]).meal
      @meeting = Meeting.find(params[:meeting_id])
      @review = Review.new
    end

    def create
      @review = Review.new(content: params["review"][:content],
        star: params["review"][:star],
        meeting_id: params[:meeting_id])
        if current_user.id == Meeting.find(params[:meeting_id]).user_id
          @review.user_id = Meeting.find(params[:meeting_id]).meal.user.id
        else
          @review.user_id = Meeting.find(params[:meeting_id]).user_id
        end
      @review.reviewer = current_user.id
      @user = Meal.find(params[:meal_id]).user
      if @review.save
        redirect_to user_path(@user)
      else
          render :new
      end
    end

    private

    def review_params
      params.require(:review).permit(:content, :star, :reviewer, :user_id)
    end

    # def set_user
    #   @user = User.find(params[:user_id, :meeting_id])
    # end
  end
