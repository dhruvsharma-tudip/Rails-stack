class AddRefrenceToSchoolFromSchoolGradeAndSchoolEssReport < ActiveRecord::Migration
  def change
    add_reference :school_ess_reports, :schools, index: true
    add_reference :school_grades, :schools, index: true
  end
end
