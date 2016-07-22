class TokenMailer < ApplicationMailer

  def login_link(user)
    @url = token_login_url(user)
    mail(to: user.email, subject: t('.your_login_link'))
  end

  def first_login(user)
    @url = token_login_url(user)
    mail(to: user.email, subject: t('.welcome'))
  end

  private

  def token_login_url(user)
    protocol = Rails.env.development?? 'http' : 'https'
    root_url(protocol: protocol, user_email: user.email, user_token: user.authentication_token)
  end
end
