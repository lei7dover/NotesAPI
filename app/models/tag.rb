class Tag < ActiveRecord::Base
  has_and_belongs_to_many :notes
  before_validation :strip_spaces,
                    :replace_spaces,
                    :strip_punctuation

  def strip_spaces
    self.name.strip!
  end

  def replace_spaces
    self.name=self.name.gsub(" ","_")
  end

  def strip_punctuation
    self.name=self.name.gsub("/\W/", "")
  end

  def self.clean_name(name)
    tag=Tag.new(name: name)
    tag.strip_spaces
    tag.strip_punctuation
    tag.name
  end
end
