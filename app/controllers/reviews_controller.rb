class ReviewsController < ApplicationController
  # before_action :set_user

    def new
      @user = Meeting.find(params[:meeting_id]).meal.user
      @meal = Meeting.find(params[:meeting_id]).meal
      @meeting = Meeting.find(params[:meeting_id])
      @review = Review.new
    end

    def create
      @review = Review.new(content: params["review"][:content], star: params["review"][:star], meeting_id: params[:meeting_id], user_id: Meeting.find(params[:meeting_id]).meal.user.id)
      @user = Meal.find(params[:meal_id]).user
      if @review.save
        redirect_to user_path(@user)
      else
        # Bug ici
        render :new
      end
    end

    private

    def review_params
      params.require(:review).permit(:content, :star)
    end

    # def set_user
    #   @user = User.find(params[:user_id, :meeting_id])
    # end
  end
