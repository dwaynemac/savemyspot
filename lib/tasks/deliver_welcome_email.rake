task :deliver_welcome_email => :environment do
  User.all.each do |user|
    if user.authentication_token.blank?
      user.save # renew auth token
      TokenMailer.first_login(user).deliver_now
    end
  end
end
