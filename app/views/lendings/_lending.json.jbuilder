json.extract! lending, :id, :user_id, :book_id, :return_date, :returned_date, :penalty, :created_at, :updated_at
json.url lending_url(lending, format: :json)
