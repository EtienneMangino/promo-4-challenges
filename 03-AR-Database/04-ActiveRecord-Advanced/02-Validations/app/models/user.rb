class User < ActiveRecord::Base
  has_many :posts

  # TODO: Add some validation*
  before_validation :change_email

  validates :username, :email, presence: true
  validates :username, uniqueness: true

  validates :email, format: { with: /\A\w+@\w+\.\w{2,3}\z/ , message: 'invalid email' }


  private

  def change_email
    self.email = self.email.gsub(/\s/, "") unless email.nil?
    # self.email = email.lstrip.rstrip unless email.nil?
  end


end

# class User < ActiveRecord::Base
#  has_many :posts
#  before_validation :stripspaces
#  validates :username, :email, presence: true
#  validates :email, format: { with: /\A\w+@\w+\.\w{2,3}\z/, message: "invalid email" }
#  validates :username, uniqueness: true
# end

# def stripspaces
#  self.email = email.lstrip.rstrip unless email.nil?
# end