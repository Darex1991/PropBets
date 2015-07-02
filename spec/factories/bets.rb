FactoryGirl.define do
  factory :bet do
    name "MyString"
    start_on { Date.today }
    finish_on { Date.today + 1.day }
    description "Test"
    prize

    trait :taken do
      taker_user_id { create(:user).id }
    end

    trait :done do
      winner_id { create(:user).id  }
    end

  end
end
