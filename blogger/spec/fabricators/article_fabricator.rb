Fabricator(:article) do
  title { [Faker::Lorem.words(6), sequence].join(" ").titleize }
  body  { Faker::Lorem.paragraph }
  author
end
