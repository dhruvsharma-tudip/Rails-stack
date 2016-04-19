class CreateSchoolEssReports < ActiveRecord::Migration
  def change
    create_table :school_ess_reports do |t|
      t.string :year
      t.string :type
      t.string :member

      t.timestamps null: false
    end
  end
end
