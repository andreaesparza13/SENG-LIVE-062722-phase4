class Production < ApplicationRecord

   validates :title, presence: true, uniqueness: true
   validates :genre, presence:true
   validates :description, presence:true, length: { maximum: 500 }
   validates :budget, presence:true
   validates :image, presence:true
   validates :director, presence:true
   validates :ongoing, presence:true
   
end
