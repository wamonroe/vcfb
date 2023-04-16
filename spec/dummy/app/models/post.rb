class Post < ApplicationRecord
  has_and_belongs_to_many :authors
end
