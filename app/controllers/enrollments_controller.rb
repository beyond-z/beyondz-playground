class EnrollmentsController < ApplicationController

  layout 'public'

  def new
    @user = User.new
  end

  def create

    @user = User.new(enrollment_params)

    case @user[:applicant_type]
    when 'other'
      @user[:applicant_details] = params[:other_details]
    when 'professional'
      @user[:applicant_details] = params[:professional_details]
    when 'grad_student'
      # Each of these has different names in the form to ensure no data
      # conflict as the user explores the bullets, but they all map to
      # the same database field since it is really the same data
      @user[:anticipated_graduation] = params[:anticipated_grad_graduation]
    when 'undergrad_student'
      @user[:anticipated_graduation] = params[:anticipated_undergrad_graduation]
    when 'school_student'
      @user[:anticipated_graduation] = 'Grade ' + params[:grade]
    end

    check_recaptcha
    check_email
    check_user
    send_user_to_next_step

  end

  private

    def enrollment_params
      params.require(:user).permit(:first_name,
        :last_name, :email, :password, :applicant_type, :city, :state_id,
        :keep_updated, :applicant_details, :anticipated_graduation)
    end

    def check_recaptcha
      verify_recaptcha() ? @recaptcha_flag = false : @recaptcha_flag = true
    end

    def check_email
      user_email = @user[:email].downcase
      User.find_by(email: user_email) ? @user_email_flag = true : @user_email_flag = false
    end

    def check_user
      @user.valid? ? @user_flag = false : @user_flag = true
    end

    def send_user_to_next_step
      if @user_email_flag && @recaptcha_flag
        flash.delete(:recaptcha_error)
        flash[:message] = 'You have already joined us, please log in.'
        redirect_to new_user_session_path
      elsif @user_email_flag
        flash[:message] = 'You have already joined us, please log in.'
        redirect_to new_user_session_path
      elsif @recaptcha_flag
        flash.delete(:recaptcha_error)
        render :new
      elsif @user_user_flag
        flash.now[:alert] = 'Please enter the required information.'
        render :new
      else
        @user.save
        redirect_to redirect_to_welcome_path(@user)
      end
    end

end
