class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    Song.all.count {|song| song.genres == self}
  end

  def artist_count
    Song.all.select {|song| song.genre_id == self.id}.map(&:artist).uniq.count
  end

  def all_artist_names
    Artist.all.map(&:name)
  end
end
