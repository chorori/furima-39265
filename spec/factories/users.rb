FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    encrypted_password    {Faker::Internet.password(min_length: 6)}
    last_name             {'test'}
    first_name            {'test'}
    last_name_kana        {'test'}
    first_name_kana       {'test'}
    birthdate             {'1990-01-01'}
  end
end