class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.split(" ").join("-").downcase
  end

  def self.find_by_slug(string)
    name = string.split("-").map do |string|
      string.capitalize
    end.join(" ")
    Artist.find_by(name: name)
  end
end
