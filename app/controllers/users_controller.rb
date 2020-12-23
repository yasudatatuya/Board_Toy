class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    game = User.find(params[:id]).liked_games
    @games = game.page(params[:page]).per(5)
  end
  before_action :authenticate_user!
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
    redirect_to user_path(current_user)
    else
    render 'edit'
    end
  end

  def nohiristeeru

  end

  def grant
    @user = current_user
    @user.update(management_permissions: true)
    redirect_to root_path
  end
  private
  def user_params
    params.require(:user).permit(:email, :name, :nickname, :comment, :profile_image, :introduction, :management_permissions)
  end

end
