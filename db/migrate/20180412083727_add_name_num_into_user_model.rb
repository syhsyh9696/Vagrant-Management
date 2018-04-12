class AddNameNumIntoUserModel < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :stuname, :string
    add_column :users, :stunum, :string
    add_column :users, :student, :boolean
  end
end
