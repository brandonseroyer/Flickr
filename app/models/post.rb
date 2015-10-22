class Post < ActiveRecord::Base
  default_scope { order('created_at DESC')}

  validates :title, presence: true


  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :comments, dependent: :destroy

  has_attached_file :image, :styles => {:standard => "750x500", :profile => "1250x830", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
