class Request < ApplicationRecord
  METHODS = %w[GET]
  belongs_to :user

  has_one :response, dependent: :destroy

  validates :url, presence: true
  # validates :method, inclusion: { in: METHODS }
end
