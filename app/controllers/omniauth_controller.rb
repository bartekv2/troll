class OmniauthController < ApplicationController

  def facebook
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect @user
    else
      flash[:alert] = "There was a problem signing you in through Facebook. Please register or try signing in later."
      redirect_to new_user_registration_url
    end
  end

  def google_oauth2
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect @user
    else
      flash[:alert] = "There was a problem signing you in through Google. Please register or try signing in later."
      redirect_to new_user_registration_url
    end
  end

  def failure
    flash[:alert] = "There was a problem signing you in. Please register or try signing in later."
    redirect_to new_user_registration_url
  end

end
