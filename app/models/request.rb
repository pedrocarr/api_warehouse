class Request < ApplicationRecord
  belongs_to :user

  has_one :response, dependent: :destroy

  validates :url, presence: true
end
