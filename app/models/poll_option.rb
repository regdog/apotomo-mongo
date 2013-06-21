class PollOption
  include Mongoid::Document

  field :name, type: String
  validates_presence_of :name
  # field :details, type: String

  belongs_to :poll
  # has_many :poll_answers
end