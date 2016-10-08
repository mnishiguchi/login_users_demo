class ManagementClient < ApplicationRecord
  include BackendUser

  has_many :property_clients

  def can_access(model)
    case model
    when Admin
      false
    when ManagementClient
      self == model
    end
  end
end
