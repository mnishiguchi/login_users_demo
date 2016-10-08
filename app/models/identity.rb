# == Schema Information
#
# Table name: logins
#
#  id                :integer          not null, primary key
#  first_name        :string
#  last_name         :string
#  email             :string
#  password_digest   :string
#  backend_user_type :string
#  backend_user_id   :integer
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Identity < ApplicationRecord
  has_secure_password # Add's authenticate method

  before_save { self.email.downcase! }

  # attr_accessor :old_password

  validates :first_name,            length: { maximum: 50  }
  validates :last_name,             length: { maximum: 50  }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }

  belongs_to :backend_user, polymorphic: true, optional: true
  belongs_to :user,                            optional: true

  # Returns the associated user if it exists. Otherwise creates and persists a new user.
  def user
    super || create_user
  end

end
