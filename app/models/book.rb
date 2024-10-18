class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher

  has_many :lendings

  has_many :lenders, through: :lendings, source: :user

  has_one_attached :cover do |attachable|
    attachable.variant :profile, resize_to_limit: [ 400, 400 ], preprocessed: true
    attachable.variant :preview, resize_to_limit: [ 200, 200 ], preprocessed: true
    attachable.variant :thumb, resize_to_limit: [ 70, 70 ], preprocessed: true
  end
end
