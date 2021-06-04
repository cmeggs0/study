class CreateEmployers < ActiveRecord::Migration[6.0]
  def change
    create_table :employers do |t|
      t.integer :professor_id
      t.integer :school_id

      t.timestamps
    end
  end
end
