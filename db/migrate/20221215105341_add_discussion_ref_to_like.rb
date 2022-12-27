class AddDiscussionRefToLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes,:discussion
  end
end
