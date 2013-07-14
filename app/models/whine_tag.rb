class WhineTag < ActiveRecord::Base
  attr_accessible :whine_id, :tag_id

  validates_presence_of :whine_id, :tag_id

  belongs_to :whine
  belongs_to :tag
end
