FactoryGirl.define do
  factory :player do
    match nil
uid "MyString"
hero "MyText"
level 1
kills 1
deaths 1
assists 1
last_hits 1
denies 1
gold 1
gpm 1
xpm 1
status "MyString"
gold_spent 1
hero_damage 1
tower_damage 1
hero_healing 1
items "MyText"
slot 1
radiant false
  end

end
