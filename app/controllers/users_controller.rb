class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
    redirect_to user_path(@user)
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
    params.require(:user).permit(:email, :last_name, :first_name, :profile_image, :introduction, :management_permissions)
  end

end
