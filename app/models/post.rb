class Post < ActiveRecord::Base
  default_scope { order('created_at DESC')}

  validates :title, presence: true


  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :comments, dependent: :destroy

  has_attached_file :image, :styles => { :small => "150x150", :medium => "300x300>", :large => "750x750", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
