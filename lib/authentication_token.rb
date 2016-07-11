module AuthenticationToken
  extend ActiveSupport::Concern

  included do
    before_save :ensure_authentication_token
  end

  def renew_token
    self.authentication_token = generate_authentication_token
  end

  protected

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def generate_authentication_token
    # TODO token should have an expiration time
    # TODO token should be encrypted on database
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end

end
