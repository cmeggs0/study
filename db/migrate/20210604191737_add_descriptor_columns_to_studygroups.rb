class AddDescriptorColumnsToStudygroups < ActiveRecord::Migration[6.0]
  def change
    add_column :studygroups, :name, :string
    add_column :studygroups, :max_members, :integer
    add_column :studygroups, :originator_id, :integer
  end
end
