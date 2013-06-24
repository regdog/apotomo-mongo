class Community
  include Mongoid::Document	
  include Mongoid::Timestamps

  field :name, type: String
  field :brief, type: String
  field :last_updated_at, type: Time

  validates_presence_of :name
  validates_uniqueness_of :name
  attr_accessible :name, :brief

  has_many :users
  has_many :pages
  has_many :widgets
  has_many :topics
  has_many :posts
  has_many :questions

end