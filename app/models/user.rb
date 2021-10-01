class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, format: { with: /\A[\w.+-]+@\w+\.\w+\z/, message: "must be a valid email address"}
    validates :username, presence: true
end
