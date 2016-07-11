class AuthorizedController < ApplicationController

  before_action :authenticate_user_from_token!

  before_action :authenticate_user!

  private

  def authenticate_user_from_token!
    user_email = params[:user_email].presence
    user       = user_email && User.find_by_email(user_email)

    if user && Devise.secure_compare(user.authentication_token, params[:user_token])
      sign_in user

      invalidate_token(user)
    end
  end

  # renew token so it can only be used for one login
  def invalidate_token(user)
    user.renew_token
    user.save
  end
end
