class AddSystemInfoInVagrantfileTable < ActiveRecord::Migration[5.1]
  def change
    add_column :vagrantfiles, :system_name, :string
    add_column :vagrantfiles, :system_version, :string
  end
end
