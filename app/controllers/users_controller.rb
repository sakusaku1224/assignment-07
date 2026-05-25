class UsersController < ApplicationController
  def account; end
  def profile; end

  def edit_profile
    @user = current_user
  end

  def update_profile
    @user = current_user
    if @user.update(profile_params)
      redirect_to profile_users_path, notice: "プロフィールを更新しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render edit_profile, status: :unprocessable_entity
    end
  end

  private
  def profile_params
    params.require(:user).permit(:name, :avatar, :bio)
  end
end
