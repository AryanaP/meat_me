class UsersController < ApplicationController
  # skip_before_action :authenticate_user!
  # before_action :current_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :age, :gender)
  end

  # def current_user
  #    @user = current_user
  # end
end
