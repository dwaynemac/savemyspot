# encoding: utf-8
class TransactionalMailer < ApplicationMailer
  def confirmation(user)
    user.update_attribute(:sent_confirmation_email, true)
    mail(to: user.email, subject: '¡Tenés tu lugar en la Avant Première del DeROSE Festival 2016 Buenos Aires!')
  end
end
