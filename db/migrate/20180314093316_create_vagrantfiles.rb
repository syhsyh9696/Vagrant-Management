class CreateVagrantfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :vagrantfiles do |t|
      t.string :filename
      t.string :author
      t.string :remark

      t.text :configure

      t.timestamps
    end
  end
end
