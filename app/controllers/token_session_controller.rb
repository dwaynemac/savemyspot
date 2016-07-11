class TokenSessionController < Devise::SessionsController

  def create
    render text: "you submitted email: #{params[:user][:email]}"
  end

end
