class CreateReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :replies do |t|
      t.string :reply
      t.string :username

      t.timestamps
    end
  end
end