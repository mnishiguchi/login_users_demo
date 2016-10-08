module BackendUser
  extend ActiveSupport::Concern

  included do
    has_one :login, as: :backend_user
    accepts_nested_attributes_for :login
  end

end
