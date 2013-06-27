class Article
  include Mongoid::Document	
  include Mongoid::Timestamps

  field :title, type: String
  field :body, type: String
  field :hits, type: Integer, :default => 0
  field :sticky, type: Boolean, :default => false
  field :locked, type: Boolean, :default => false
  # field :posts_count, type: Integer, :default => 0
  field :category, type: Integer

  validates_presence_of :title, :body

  attr_accessible :title, :body, :column_id, :community_id

  belongs_to :column
  belongs_to :user
  belongs_to :community

  # has_many :comments

  def hit!
    self.class.increment_counter :hits, id
  end

end