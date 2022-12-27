class AddColumnToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :start_time, :datetime
  end
end
