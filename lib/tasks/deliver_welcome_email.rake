task :deliver_welcome_email => :environment do
  return unless Date.today == Date.civil(2016,8,1)
  User.all.each do |user|
    if user.authentication_token.blank?
      user.save # renew auth token
      TokenMailer.first_login(user).deliver_now
    end
  end
end
