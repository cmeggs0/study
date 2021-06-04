class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :course_id
      t.string :comment
      t.integer :user_id

      t.timestamps
    end
  end
end
