class User < ApplicationRecord
    has_many :lists
    store :lists
    has_secure_password
    validates :email, uniqueness: true
end
