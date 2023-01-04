class User < ApplicationRecord
  has_many :questions, dependent: :delete_all
  has_many :authors_questions, class_name: "Question", foreign_key: "author_id"

  has_secure_password

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

  validates :navbar_color,
            format: { with: /\A#[a-f0-9]{6}\z/ }

  include Gravtastic
  gravtastic(secure:true, filetype: :png, size: 100, default: "retro")

  private
  def downcase_nickname
    nickname.downcase!
  end
end
