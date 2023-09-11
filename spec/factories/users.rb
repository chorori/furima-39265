FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              {  '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { "凪" }
    first_name            { "誠志郎" } 
    last_name_kana        { "ナギ" } 
    first_name_kana       { "セイシロウ" } 
    birthdate             { Faker::Date.birthday } 
  end
end

