class User < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :full_name, :role, presence: true

  before_create :generate_auth_token

  private

  def generate_auth_token
    loop do
      self.auth_token = SecureRandom.hex(20)
      break unless User.exists?(auth_token: auth_token)
    end
  end
end