class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.belongs_to :chatroom, null: false, foreign_key: true
      t.string :username
      t.string :data

      t.timestamps
    end
  end
end
