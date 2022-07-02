class Author < ActiveRecord::Base
  attr_accessor :avatar, :password

  has_and_belongs_to_many :posts

  enum gender: {male: 0, female: 1, other: 2}
  has_rich_text :biography
end
