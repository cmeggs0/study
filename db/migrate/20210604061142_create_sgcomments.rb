class CreateSgcomments < ActiveRecord::Migration[6.0]
  def change
    create_table :sgcomments do |t|
      t.integer :user_id
      t.integer :studygroup_id

      t.timestamps
    end
  end
end
