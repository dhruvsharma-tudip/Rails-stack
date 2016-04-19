class AdminsGrid
  include Datagrid

  scope do
    User
  end
  filter(:id, :integer)
  filter(:email, :string) { |value| where('email like ?', "%#{value}%") }
  filter(:sign_in_count, :integer)
  filter(:last_sign_in_at, :date, range: true)
  filter(:created_at, :date, range: true)

  column(:id)
  column(:email)
  column(:sign_in_count)
  column(:first_name)
  column(:last_name)
  column(:current_sign_in_at) do |user|
    user.current_sign_in_at.to_time if user.last_sign_in_at
  end
  column(:last_sign_in_at) do |user|
    user.last_sign_in_at.to_time if user.last_sign_in_at
  end
  column(:created_at) do |user|
    user.created_at.to_time
  end
end
