class CreateAnnouncements < ActiveRecord::Migration[5.1]
  def change
    create_table :announcements do |t|
      t.string :title
      t.string :author
      t.string :class
      t.text :content

      t.timestamps
    end
  end
end
