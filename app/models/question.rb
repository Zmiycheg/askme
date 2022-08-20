class Question < ApplicationRecord

   validates :body, length: {minimum: 3, maximum: 280}, presence: true

end
