class Profile < ActiveRecord::Base
  # Association for profile with user
  belongs_to :user
end
