# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end


  skip_before_action :verify_authenticity_token

  # def sign_in_with(provider_name)
  # @user = User.from_omniauth(request.env["omniauth.auth"])
  # sign_in_and_redirect @user, :event => :authentication
  # set_flash_message(:notice, :success, :kind => provider_name) if is_navigational_format?
  # end
  def github
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      flash.notice = "Signed in!"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.user_attributes"] = @user.attributes
      puts @user.errors
      redirect_to new_user_registration_url
    end
  end
end
