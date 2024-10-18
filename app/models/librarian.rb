class Librarian < ApplicationRecord
  devise :database_authenticatable, :validatable
end
