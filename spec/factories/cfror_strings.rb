FactoryGirl.define do
  factory :cfror_string, :class => 'Cfror::String' do
    field
    body {Faker::Lorem.word}
  end

end
