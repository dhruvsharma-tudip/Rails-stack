class ChangeWhenlookingforInProfile < ActiveRecord::Migration
  def change
    change_column :profiles, :whenlookkingfor, :string
  end
end
