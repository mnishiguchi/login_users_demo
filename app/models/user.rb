class User < ApplicationRecord
  has_one :login
  accepts_nested_attributes_for :login
end
