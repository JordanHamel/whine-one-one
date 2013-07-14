class Whine < ActiveRecord::Base
  attr_accessible :message

  validates_presence_of :message
  validates_length_of :message, :maximum => 200

  has_many :whine_tags
  has_many :tags, :through => :whine_tags
end
