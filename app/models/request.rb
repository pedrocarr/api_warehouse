class Request < ApplicationRecord
  METHODS = %w[GET POST PUT DELETE]
  belongs_to :user

  has_one :response

  validates :url, presence: true
  validates :method, inclusion: { in: METHODS }
end