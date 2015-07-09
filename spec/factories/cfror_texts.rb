FactoryGirl.define do
  factory :cfror_text, :class => 'Cfror::Text' do
    field
    body {Faker::Lorem.paragraph}
  end

end
