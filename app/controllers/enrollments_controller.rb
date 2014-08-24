class EnrollmentsController < ApplicationController
  include HasUserForm

  layout 'public'

  def new
    states
    @user = User.new
  end

  def create
    user = params[:user].permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :applicant_type,
      :city,
      :state,
      :keep_updated)

    process_applicant_type!(user)

    @new_user = User.create(user)

    if @new_user.errors.any?
      states
      @user = @new_user
      render 'new'
      return
    end

    unless @new_user.id
      # If User.create failed; we have an existing user
      # trying to sign up again. Instead, let's tell them
      # to log in
      flash[:message] = 'You have already joined us, please log in.'
      redirect_to new_user_session_path
      return
    end

    redirect_to redirect_to_welcome_path(@new_user)
  end
end
