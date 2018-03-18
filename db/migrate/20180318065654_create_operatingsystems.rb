class CreateOperatingsystems < ActiveRecord::Migration[5.1]
  def change
    create_table :operatingsystems do |t|
      t.string :system_name
      t.string :system_version
    end
  end
end
