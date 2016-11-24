class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    # raise
    if params[:id].to_i == current_user.id
      @user = current_user
    else
      flash[:alert] = 'Nice try! - This is nor your profile...'
      redirect_to :root
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :age, :gender, :photo, :email)
  end
end
