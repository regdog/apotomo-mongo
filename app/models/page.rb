# encoding: UTF-8
class Page
  include Mongoid::Document	
  include Mongoid::Timestamps

  before_create :default_values

  field :name, type: String, default: "未命名"

  validates_presence_of :name

  has_many :widgets
  belongs_to :community

  def default_values
  	self.name = "未命名"   	
  end

end