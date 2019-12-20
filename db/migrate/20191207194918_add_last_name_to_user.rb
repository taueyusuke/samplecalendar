class AddLastNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name, :string, null: false, default: ""
  end
end