class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user  #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    set_flash_message(:alert, :failure, :kind => "Google", reason: failure_message) if is_navigational_format?
    redirect_to root_path
  end
end
