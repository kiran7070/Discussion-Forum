class AddColumnToDiscussion < ActiveRecord::Migration[7.0]
  def change
    add_column :discussions, :start_time, :datetime
  end
end
