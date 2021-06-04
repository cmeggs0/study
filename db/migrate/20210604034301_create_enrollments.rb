class CreateEnrollments < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollments do |t|
      t.integer :school_id
      t.integer :user_id

      t.timestamps
    end
  end
end
