FactoryBot.define do
  factory :weapon do
    name { FFaker::Name.last_name }
    description { FFaker::Lorem.word }
    power_base { FFaker::Random.rand(1..3000) }
    power_step { FFaker::Random.rand(1..100) }
    level { FFaker::Random.rand(1..30) }
  end
end
