class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.text    :address
      t.string  :avg_class_size
      t.text    :demo_graphics
      t.text    :description
      t.string  :name
      t.string  :network
      t.string  :number_of_students
      t.string  :nwea_math
      t.string  :nwea_reading
      t.string  :school_id
      t.string  :school_level_number
      t.string  :school_options
      t.string  :school_sparrow_score
      t.string  :short_name
      t.text    :statistics
      t.string  :student_options
      t.string  :web_address

      t.timestamps null: false
    end
  end
end
