class CreateJudgements < ActiveRecord::Migration[5.1]
  def change
    create_table :judgements do |t|
      t.string :filename
      t.string :author
      t.string :remark
      t.text :command

      t.timestamps

      t.belongs_to :experiment, index: true
    end
  end
end
