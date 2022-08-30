class User < ApplicationRecord
  has_secure_password

  before_validation :downcase_atributes

  validates :email, presence: true, uniqueness:true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :nickname, length: { maximum: 40 }, presence: true, uniqueness:true,
    format: { with: /\A[a-z0-9_]+\z/ }
  validates :header_color, presence: true, format: {with: /\A#[0-9A-Fa-f]{3,6}\z/}

  has_many :questions, dependent: :delete_all
  has_many :asked_questions, class_name: 'Question', foreign_key: :author_id, dependent: :nullify

  include Gravtastic
    gravtastic(secure: true, filetype: :png, size: 100, default: 'wavatar')

  def to_param
    nickname
  end

  private

  def downcase_atributes
    nickname&.downcase!
    email&.downcase!
  end
end
