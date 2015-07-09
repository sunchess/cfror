FactoryGirl.define do
  factory :cfror_select_option, :class => 'Cfror::SelectOption' do
    field
    body {Faker::Lorem.word}
  end

end
