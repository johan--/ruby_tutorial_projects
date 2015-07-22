class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :rating, :director

  def director
    Faker::Name.name
  end
end
