class User < ApplicationRecord
  has_secure_password
  def downcase_nickname
    nickname.downcase!
  end

  before_validation :downcase_nickname

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP, message: "введен неверно"  }

  validates :nickname,
            presence: true,
            uniqueness: true,
            format: { with: /\A\w*\z/, message: "должен содеражать только латинские буквы, цифры и _" },
            length: { maximum: 40 }
end
