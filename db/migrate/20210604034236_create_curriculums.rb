class CreateCurriculums < ActiveRecord::Migration[6.0]
  def change
    create_table :curriculums do |t|
      t.integer :professor_id
      t.integer :course_id

      t.timestamps
    end
  end
end
