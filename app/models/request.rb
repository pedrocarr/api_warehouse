class Request < ApplicationRecord
  # METHODS = %w(GET POST PUT DELETE)
  belongs_to :user

  # has_one :response

  # validates :url, presence: true
  # validates :method, inclusion: { in: METHODS, message: "#{value} is not a valid HTTP method" }
end
