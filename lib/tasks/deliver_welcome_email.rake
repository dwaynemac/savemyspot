task :deliver_welcome_email => :environment do
  User.where("sent_first_login_link IS NULL OR NOT sent_first_login_link").each do |user|
    if user.authentication_token.blank?
      user.save # renew auth token
    end

    TokenMailer.first_login(user).deliver_now
    user.update_attribute(:sent_first_login_link, true)
  end
end
