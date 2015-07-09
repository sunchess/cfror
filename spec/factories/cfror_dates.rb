FactoryGirl.define do
  factory :cfror_date, :class => 'Cfror::Date' do
    field
    body {Date.today}
  end

end
