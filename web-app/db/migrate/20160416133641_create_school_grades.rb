class CreateSchoolGrades < ActiveRecord::Migration
  def change
    create_table :school_grades do |t|
      t.string :year
      t.string :type
      t.string :score
      t.string :exam_type

      t.timestamps null: false
    end
  end
end
