class TokenMailerPreview < ActionMailer::Preview

  def first_login
    TokenMailer.first_login(User.first)
  end

end
