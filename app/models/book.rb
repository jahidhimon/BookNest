class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher

  has_one_attached :cover do |attachable|
    attachable.variant :preview, resize_to_limit: [ 300, 300 ], preprocessed: true
    attachable.variant :thumb, resize_to_limit: [ 50, 50 ], preprocessed: true
  end
end
