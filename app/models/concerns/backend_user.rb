module BackendUser
  extend ActiveSupport::Concern

  included do
    has_one :identity, as: :backend_user
    accepts_nested_attributes_for :identity
  end

end
