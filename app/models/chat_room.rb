class ChatRoom < ApplicationRecord
    has_secure_password
    has_many :messages
    validates :name, presence: true
end
