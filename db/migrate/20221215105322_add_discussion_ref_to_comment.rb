class AddDiscussionRefToComment < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments,:discussion
  end
end
