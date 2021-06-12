class CreateFriendRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :friend_requests do |t|
      t.bigint :sender_id, null: false
      t.bigint :receiver_id, null: false

      t.timestamps
    end
  end
end
