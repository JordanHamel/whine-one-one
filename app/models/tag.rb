class Tag < ActiveRecord::Base
  attr_accessible :text
  before_save :downcase

  validates_presence_of :text
  validates_length_of :text, :maximum => 30

  has_many :whine_tags
  has_many :whines, :through => :whine_tags

  private
  def downcase
    self.text = self.text.downcase
  end
end
