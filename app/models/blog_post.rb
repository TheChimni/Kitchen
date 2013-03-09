class BlogPost < ActiveRecord::Base
  validates_presence_of :title, :content
  before_create :set_publication_date

  has_many :blog_post_photos

  scope :published, where("published_at < ?", DateTime.now)

  def set_publication_date
    self.published_at = DateTime.now unless self.published_at
  end

  def html_content
    BlueCloth.new(self.content).to_html
  end
end
