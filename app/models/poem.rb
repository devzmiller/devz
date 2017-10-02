class Poem < ActiveRecord::Base
  validates :body, presence: true
end
