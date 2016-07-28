class TransactionalMailer < ApplicationMailer
  def confirmation(user)
    user.update_attribute(:sent_confirmation_email, true)
    mail(to: user.email, subject: '')
  end
end
