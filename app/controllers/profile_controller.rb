class ProfileController < ApplicationController
  include HasUserForm
  
  before_action :require_user
  before_action :use_controller_js
  
  def edit
    states
    @user = current_user
  end
  
  def update
    user = params[:user].permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :applicant_type,
      :city,
      :state,
      :keep_updated,
      :linkedin_profile)

    process_applicant_type!(user)

    @user = current_user

    if @user.update(user)
      flash[:message] = "Profile updated"
      redirect_to(profile_path)
    else
      states
    end
  end
  
  private
  
  def require_user
    unless user_signed_in?
      flash[:error] = 'Please log in to see your profile.'
      redirect_to new_user_session_path
    end
  end
end
