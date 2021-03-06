class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :description
      t.integer :school_id
      t.string :schedule
      t.string :quarter
      t.string :title
      t.string :course_number
      t.string :section_number
      t.string :program
      t.integer :comments_count
      t.integer :studygroups_count

      t.timestamps
    end
  end
end
