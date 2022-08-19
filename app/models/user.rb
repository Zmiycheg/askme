class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :email, presence: true, uniqueness:true
  validates :email, format: { with: /\A^[a-z\d_+.\-]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+$\z/i, message: 'Проверьте email' }
  validates :nickname, length: { minimum: 3, maximum: 40 }, presence: true, uniqueness:true

  def downcase_nickname
    nickname.downcase!
  end
end