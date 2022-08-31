class Production < ApplicationRecord
   validates :title, :director, presence: true
   validates :budget, numericality: { greater_than: 0 }
end
