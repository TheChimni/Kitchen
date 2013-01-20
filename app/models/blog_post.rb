class BlogPost < ActiveRecord::Base
  validates_presence_of :title, :content
  before_create :set_publication_date

  def set_publication_date
    self.published_at = DateTime.now unless self.published_at
  end
end
