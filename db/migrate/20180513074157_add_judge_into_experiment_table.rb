class AddJudgeIntoExperimentTable < ActiveRecord::Migration[5.1]
  def change
    add_column :experiments, :judge, :text
  end
end
