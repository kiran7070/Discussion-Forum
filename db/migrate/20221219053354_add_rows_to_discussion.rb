class AddRowsToDiscussion < ActiveRecord::Migration[7.0]
  def change
    add_column :discussions, :name, :string
  end
end
