class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.split(" ").join("-").downcase
  end

  def self.find_by_slug(string)
    # name = string.split("-").map do |string|
    #   string.capitalize
    # end.join(" ")
    # Song.find_by(name: name)
    Song.all.find do |song|
      song.slug == string
    end
  end

end
