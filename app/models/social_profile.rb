class SocialProfile < ApplicationRecord
  belongs_to :backend_user, polymorphic: true, optional: true
  belongs_to :user,                            optional: true

  store      :others

  # validates_uniqueness_of :uid, scope: :provider
  #
  # # Returns a SocialProfile object that corresponds to the specified data.
  # def self.find_or_create_from_oauth(auth)
  #   find_or_create_by(uid: auth.uid, provider: auth.provider).tap do |profile|
  #     profile.save_oauth_data(auth)
  #   end
  # end
  #
  # def save_oauth_data(auth)
  #   # Create params in correct format, then update the profile.
  #   self.update_attributes(params_from_oauth(auth)) if valid_oauth?(auth)
  # end
  #
  # def associate_with_user(user)
  #   # NOTE: Profile user and the specified user must match.
  #   self.update!(user_id: user.id) unless self.user == user
  # end
  #
  # private
  #
  #   # Returns params based on the specified authentication data.
  #   def params_from_oauth(auth)
  #     class_name = "#{auth['provider']}".classify  # Facebook, Twitter etc.
  #     "SocialProfileParams::#{class_name}".constantize.new(auth).params
  #   end
  #
  #   def valid_oauth?(auth)
  #     (self.provider.to_s == auth['provider'].to_s) && (self.uid == auth['uid'])
  #   end
  end
