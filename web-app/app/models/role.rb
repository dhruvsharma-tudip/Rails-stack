class Role < ActiveRecord::Base
  # Associations for Role with UsersRole and User
  has_many :users_roles
  has_many :users, through: :users_roles
end
