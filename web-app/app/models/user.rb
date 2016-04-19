class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Associations for User with Users_role and Role
  has_many :users_roles
  has_many :roles, through: :users_roles

  # Associations for User with profile
  has_one :profile
  accepts_nested_attributes_for :profile
  attr_accessor :skip_password_validation
  attr_accessor :name

  has_attached_file :avatar, default_url: 'profile-icon.png', styles: {
    thumb: '100x100#',
    small: '150x150>',
    medium: '200x200!' }

  # has_attached_file :avatar,
  #                   :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
  #                   :url => "/system/:attachment/:id/:style/:filename",
  #                   :styles => { :medium => "300x300>", :thumb => "100x100>" },
  #                   :default_url => "profile-icon.png"
  #
  # Validating Image For Specific Types.
  validates_attachment :avatar,
                       content_type: { content_type: ['image/jpeg', 'image/gif', 'image/png'] }

  # This Action will allow to find whether the user holds the role as Admin
  def is_admin?
    status = false
    roles.each do |role_entry|
      status = true if role_entry.name == 'Admin'
    end
    status
  end

  # This Action will allow to find whether the user holds the role as Prospect
  def is_prospect?
    status = false
    roles.each do |role_entry|
      status = true if role_entry.name == 'Prospect'
    end
    status
  end

  # This action will allow to set default role as prospect at sign up
  def set_prospect_role_at_sign_up
    UsersRole.new.add(Role.where(name: 'Prospect').first.id, User.last.id)
  end

  # This action will allow to set role at the time of admin create new user
  def set_role_by_admin(role_id, user_id)
    UsersRole.new.add(role_id, user_id)
  end

  private

  def password_required?
    return false if skip_password_validation
    super
  end

  def strip_whitespace
    self.first_name = first_name.strip unless first_name.nil?
    self.last_name = last_name.strip unless last_name.nil?
  end

  def self.get_all_users
    return User.all
  end
end

