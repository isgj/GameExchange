class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def oauth(provider)
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      begin
        sign_in_and_redirect @user  #this will throw if @user is not activated
        set_flash_message(:notice, :success, :kind => provider.capitalize) if is_navigational_format?
      rescue => e
        logger.error "Rescued from #{e.inspect}, authentication from #{provider}"
        set_flash_message(:notice, :success, :kind => "Error while authenticating")
        redirect_to new_user_registration_url
      end
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"]
      set_flash_message(:notice, :success, :kind => "Error while authenticating")
      redirect_to new_user_registration_url
    end
  end

  def google
    oauth("google")
  end

  def facebook
    oauth("facebook")
  end

  def failure
    set_flash_message(:alert, :failure, :kind => "Google", reason: failure_message) if is_navigational_format?
    redirect_to root_path
  end
end
