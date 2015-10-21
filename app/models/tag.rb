class Tag < ActiveRecord::Base
  default_scope { order('name ASC')}
  validates :name, presence: true
  has_and_belongs_to_many :posts
end
