class User < ApplicationRecord
  has_secure_password

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness:true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :nickname, length: {maximum: 40 }, presence: true, uniqueness:true,
    format: { with: /\A[a-z0-9_]+\z/ }

  has_many :questions, dependent: :delete_all

  private

  def downcase_nickname
    nickname.downcase!
  end

  def downcase_email
    email.downcase!
  end
end
