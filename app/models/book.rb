class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher

  has_many :lendings

  has_many :lenders, through: :lendings, source: :user

  has_one_attached :cover do |attachable|
    attachable.variant :profile, resize_to_limit: [ 400, 400 ]
    attachable.variant :preview, resize_to_limit: [ 200, 200 ]
    attachable.variant :thumb, resize_to_limit: [ 50, 50 ]
  end
end
