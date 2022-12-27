class AddRowToDiscussion < ActiveRecord::Migration[7.0]
  def change
    add_column :discussions, :image, :string
  end
end
