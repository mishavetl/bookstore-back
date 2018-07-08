class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable

  include DeviseTokenAuth::Concerns::User

  validates_presence_of :email
  validates_uniqueness_of :email

  def confirmation_required?
    false && !confirmed?
  end
end
