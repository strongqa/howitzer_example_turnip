FactoryGirl.define do
  factory :comment do
    body { "Comment #{generate(:serial)}" }
  end
end