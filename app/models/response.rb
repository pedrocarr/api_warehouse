class Response < ApplicationRecord
  belongs_to :request, dependent: :destroy

  validates :body, presence: true
end
