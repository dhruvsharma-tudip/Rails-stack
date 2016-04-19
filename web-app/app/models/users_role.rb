class UsersRole < ActiveRecord::Base
  # Associations for UsersRole with User and Role
  belongs_to :user
  belongs_to :role

  def add(role_id, user_id)
    UsersRole.create(role_id: role_id,
                     user_id: user_id
                    )
  end
end
