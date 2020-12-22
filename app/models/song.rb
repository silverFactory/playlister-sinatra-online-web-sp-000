class Song < ActiveRecord::Base
  belongs_to :artist
  # has_many :genres, through: :songs_genres
  # has_many :songs_genres
  has_and_belongs_to_many :genres, join_table: "song_genres"

  def slug
    self.name.downcase.split(" ").join("-")
  end
  def self.find_by_slug(slug)
    unslug = slug.split("-").map { |w| w.capitalize() }
    Song.find_by(name: "#{unslug.join(" ")}")
  end
end
