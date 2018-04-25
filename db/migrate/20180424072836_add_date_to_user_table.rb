class AddDateToUserTable < ActiveRecord::Migration[5.1]
  def change
    add_column :experiments, :expiration_date, :timestamp
  end
end
