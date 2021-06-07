class AddContentToSgcomments < ActiveRecord::Migration[6.0]
  def change
    add_column :sgcomments, :content, :string
  end
end
