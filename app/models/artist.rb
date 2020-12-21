class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    unslug = slug.split("-").map { |w| w.capitalize() }
    Artist.find_by(name: "#{unslug.join(" ")}")
  end
  def self.unslug(slug)
    slug.split("-").join(" ")
  end
end
