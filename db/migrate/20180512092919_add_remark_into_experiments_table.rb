class AddRemarkIntoExperimentsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :experiments, :remark, :string
  end
end
