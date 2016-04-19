class ChangeDataTypeInProfile < ActiveRecord::Migration
  def change
    change_column :profiles, :budget, :string
    change_column :profiles, :phonenumber, :string
    change_column :profiles, :whenlookkingfor, :string
  end
end
