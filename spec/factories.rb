FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    password { Faker::Internet.password }
    city { Faker::Address.city }
    profession { Faker::Name.title }
  end
end