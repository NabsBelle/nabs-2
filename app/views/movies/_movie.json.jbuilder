json.extract! movie, :id, :name, :picture, :release_date, :description, :rating,  :created_at, :updated_at
json.url movie_url(movie, format: :json)
