class Post < ActiveRecord::Base
  belongs_to :user

  # TODO: Add some validation
  validates_presence_of :name, :url, :user
  validates :name, length: { minimum: 5 }
  validates :name, uniqueness: { case_sensitive: false }
  validates :url, format: { with: /\A(?:http:\/\/)?(?:([\w-]+)\.)?([\w-]+)\.([\w]+)\/?(?:([^?#$]+))?(?:\?([^#$]+))?(?:#(.*))?\z/, message: "invalid url" }
end