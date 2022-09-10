class User < ApplicationRecord
    has_many :tickets
    has_many :productions, through: :tickets

    # bcrypt gem macro
    has_secure_password
end
