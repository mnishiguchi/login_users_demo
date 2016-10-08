class Login < ApplicationRecord
  has_secure_password # Add's authenticate method

  before_save { self.email = email.downcase }

  attr_accessor :old_password

  validates :first_name,            length: { maximum: 50  }
  validates :last_name,             length: { maximum: 50  }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }

  belongs_to :backend_user, polymorphic: true, optional: true
  belongs_to :user,                            optional: true

  def user
    super || create_user
  end

end
