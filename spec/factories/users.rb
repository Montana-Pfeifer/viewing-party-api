FactoryBot.define do
    factory :user do
      name { "Test User" }
      username { "test_user" }
      password { "password" }
      password_digest { "password" }
    end
  end