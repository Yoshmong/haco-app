FactoryBot.define do
  factory :spot do
    id               { '0' }
    use_id           { Faker::Number.between(from: 1, to: 48) }
    spot_name        { Gimei.name.kanji }
    area_id          { Faker::Number.between(from: 1, to: 5) }
    postal_code      { '123-4567' }
    address          { Gimei.town.kanji }
    building         { '建物名' }
    phone_number     { "0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}" }
    end
    end
    
  end
end
