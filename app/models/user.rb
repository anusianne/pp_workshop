class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable, :timeoutable, :recoverable, :rememberable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username, presence: true
  validates :email, presence: true,
  uniqueness: { case_sensitive: false },
  format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true

end







