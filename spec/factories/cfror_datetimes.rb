FactoryGirl.define do
  factory :cfror_datetime, :class => 'Cfror::Datetime' do
    field
    body {DateTime.now}
  end

end
