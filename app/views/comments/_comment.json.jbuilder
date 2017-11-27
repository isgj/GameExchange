json.extract! comment, :id, :mark, :commentator_id, :commented_id, :review, :created_at, :updated_at
json.url comment_url(comment, format: :json)
