class TokenSessionController < Devise::SessionsController

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user
      TokenMailer.login_link(@user).deliver_now
    else
      flash.alert = t('.email_not_registered')
      redirect_to new_user_session_path
    end
  end

end
