class Note < ActiveRecord::Base
  has_and_belongs_to_many :tags
  validates_presence_of :title, :body
  belongs_to :user
  def tag_names=(tags)
    tags.split(",").collect{|t| t.strip}.each do |tag|
    this_tag=Tag.find_or_create_by(name: Tag.clean_name(tag))
    self.tags << this_tag
    end
  end

  def tag_names
    self.tags.collect{|t| t.name} .join (",")
  end

end
