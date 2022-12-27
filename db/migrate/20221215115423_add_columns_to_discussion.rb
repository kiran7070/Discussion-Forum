class AddColumnsToDiscussion < ActiveRecord::Migration[7.0]
  def change
    add_column :discussions, :likes, :integer, default: 0
  end
end
