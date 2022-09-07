class ProductionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :genre, :director, :budget, :ongoing
  has_many :cast_members

  def ongoing
    self.object.ongoing ? 'In production' : 'Not in production'
  end
end
