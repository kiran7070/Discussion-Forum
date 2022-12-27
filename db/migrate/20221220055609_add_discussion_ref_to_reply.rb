class AddDiscussionRefToReply < ActiveRecord::Migration[7.0]
  def change
    add_reference :replies,:comment
  end
end
