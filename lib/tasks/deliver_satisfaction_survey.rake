task :deliver_satisfaction_surver => :environment do
  User.where(sent_confirmation_email: true).where("sent_satisfaction_survey IS NULL OR NOT sent_satisfaction_survey").each do |user|
    unless user.email.blank?
      TransactionalMailer.satisfaction_survey(user).deliver_now
      user.update_attribute(:sent_satisfaction_survey, true)
    end
  end
end
