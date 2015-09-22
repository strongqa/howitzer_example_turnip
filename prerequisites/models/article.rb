class Article
  include Her::Model
  has_many :comments
  include_root_in_json true
  parse_root_in_json true, format: :active_model_serializers
end