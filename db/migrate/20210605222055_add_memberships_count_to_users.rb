class AddMembershipsCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :memberships_count, :integer
  end
end
