class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.integer :chat_room_id
      t.string :username
      t.string :data

      t.timestamps
    end
  end
end
