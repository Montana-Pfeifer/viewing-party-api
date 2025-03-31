FactoryBot.define do
    factory :viewing_party do
      name { "Test Viewing Party" }
      start_time { "2025-02-01 10:00:00" }
      end_time { "2025-02-01 14:30:00" }
      movie
      user
    end
  end