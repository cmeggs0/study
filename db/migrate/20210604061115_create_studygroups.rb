class CreateStudygroups < ActiveRecord::Migration[6.0]
  def change
    create_table :studygroups do |t|
      t.integer :course_id
      t.string :timeblock
      t.integer :members_count
      t.integer :sgcomments_count

      t.timestamps
    end
  end
end
