class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :stu_name
      t.string :stu_number
      
      t.timestamps
    end
  end
end
