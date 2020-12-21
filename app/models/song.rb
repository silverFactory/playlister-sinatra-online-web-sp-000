class Song < ActiveRecord::Base
  belongs_to :artist
  # has_many :genres, through: :songs_genres
  # has_many :songs_genres
  has_and_belongs_to_many :genres, join_table: "songs_genres"
end
