class Genre < ActiveRecord::Base
  has_and_belongs_to_many :songs, join_table: "song_genres"
  has_many :artists, through: :songs

  def slug
    self.name.downcase.split(" ").join("-")
  end
  def self.find_by_slug(slug)
    unslug = slug.split("-").map { |w| w.capitalize() }
    Genre.find_by(name: "#{unslug.join(" ")}")
  end
end
