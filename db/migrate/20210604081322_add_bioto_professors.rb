class AddBiotoProfessors < ActiveRecord::Migration[6.0]
  def change
    add_column :professors, :bio, :string
  end
end
