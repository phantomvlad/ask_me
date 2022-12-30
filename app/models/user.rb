class User < ApplicationRecord
  has_secure_password
  def downcase_nickname
    nickname.downcase!
  end

  before_validation :downcase_nickname

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :nickname,
            presence: true,
            uniqueness: true,
            format: { with: /\A\w*\z/ },
            length: { maximum: 40 }
end
