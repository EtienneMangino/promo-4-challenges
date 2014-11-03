class Post < ActiveRecord::Base

  validates_presence_of :name, :url
  validates :name, length: { minimum: 5 }
  validates :name, uniqueness: { case_sensitive: false }
  validates :url, format: { with: /\A(?:http:\/\/)?(?:([\w-]+)\.)?([\w-]+)\.([\w]+)\/?(?:([^?#$]+))?(?:\?([^#$]+))?(?:#(.*))?\z/, message: "invalid url" }

  # TODO: Add some validation
  default_scope { order('votes DESC') }
end