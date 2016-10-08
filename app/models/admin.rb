class Admin < ApplicationRecord
  include BackendUser

  def account_executives
    AccountExecutive.all
  end

  def can_access(model)
    true
  end
end
