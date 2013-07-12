class Whine < ActiveRecord::Base
  attr_accessible :message

  validates_presence_of :message
  validates_length_of :message, :maximum => 200
end
