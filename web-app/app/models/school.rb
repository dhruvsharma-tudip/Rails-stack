class School < ActiveRecord::Base
  has_many :school_ess_reports
  has_many :school_grades

  serialize :address, JSON
  serialize :demo_graphics, JSON
  serialize :statistics, JSON
end
