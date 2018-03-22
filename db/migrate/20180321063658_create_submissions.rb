class CreateSubmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :submissions do |t|
      t.boolean :status
      t.text :content
      t.timestamps

      t.belongs_to :user, index: true
      t.belongs_to :experiment, index: true
    end
  end
end
