class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.split(" ").join("-").downcase
  end

  def self.find_by_slug(string)
    name = string.split("-").map do |string|
      string.capitalize
    end.join(" ")
    Genre.find_by(name: name)
  end
end
