class Post
  include Mongoid::Document	
  include Mongoid::Timestamps

  field :body, type: String

  validates_presence_of :body
  attr_accessible :body

  belongs_to :forum
  belongs_to :topic
  belongs_to :user
  belongs_to :community

  before_save :topic_locked?

  private
    def topic_locked?
      if topic.locked?
        
      end  
    end
end