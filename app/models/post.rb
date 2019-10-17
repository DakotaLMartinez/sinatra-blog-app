class Post < ActiveRecord::Base
  has_many :comments
  validates :title, :content, presence: true
  def self.visible 
    where(deleted: false)
  end
end