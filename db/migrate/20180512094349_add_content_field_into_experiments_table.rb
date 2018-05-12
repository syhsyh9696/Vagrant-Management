class AddContentFieldIntoExperimentsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :experiments, :content, :text
  end
end
