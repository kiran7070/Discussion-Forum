class AddingColumnToDiscussion < ActiveRecord::Migration[7.0]
  def change
    add_column :discussions, :pinned, :boolean,default: false
  end
end
