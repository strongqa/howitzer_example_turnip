FactoryGirl.define do
  factory :article do
    title { "Article title #{generate(:serial)}"}
    text { 'Test text' }
  end
end
