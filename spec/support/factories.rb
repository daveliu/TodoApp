FactoryGirl.define do
  factory :user, aliases: [:owner] do
    sequence(:email) {|n| "user#{n}@example.com" }
    password "secretpassword"
  end


  factory :todo do
    user
    sequence(:content) {|n| "Todo #{n}" }
  end
end
