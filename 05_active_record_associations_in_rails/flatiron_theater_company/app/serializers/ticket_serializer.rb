class TicketSerializer < ActiveModel::Serializer
  attributes :id, :price

  belongs_to :production

  # def production
  #   {title: self.object.production.title}
  # end
end
