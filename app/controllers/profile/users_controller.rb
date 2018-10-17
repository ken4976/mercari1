class Profile::UsersController < ApplicationController
  before_action :move_to_sign_in

  def edit
  end

  def update
    current_user.update(profile_params)
    redirect_to user_path(current_user)
  end

  private

  def profile_params
    params.require(:user).permit(:nickname, :introduction)
  end

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end
end
