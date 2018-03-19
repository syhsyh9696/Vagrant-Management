class AddVagrantfileToOperatingsystem < ActiveRecord::Migration[5.1]
  def change
    add_reference :vagrantfiles, :operatingsystem, index: true
  end
end
