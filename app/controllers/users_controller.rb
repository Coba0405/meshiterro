class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def new
  end

  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to edit_user_path(user_params)
  end
  
  
  def edit
    @user = User.find(params[:id])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
  end


