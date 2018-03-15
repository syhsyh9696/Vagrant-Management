class AddFileVersionInVagrantfileTable < ActiveRecord::Migration[5.1]
  def change
    add_column :vagrantfiles, :version, :string
  end
end
