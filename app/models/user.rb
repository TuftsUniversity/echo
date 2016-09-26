class User < ApplicationRecord
  devise :ldap_authenticatable, :timeoutable, :trackable

  validates :username, presence: true
end
