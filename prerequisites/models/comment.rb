class Comment
  include Her::Model
  collection_path "articles/:article_id/comments"
end