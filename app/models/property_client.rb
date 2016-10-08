class PropertyClient < ApplicationRecord
  include BackendUser

  belongs_to :account_executive, optional: true
  belongs_to :management_client, optional: true

  def can_access(model)
    case model
    when Admin, MitsContainer
      false
    else
      false
    end
  end
end
