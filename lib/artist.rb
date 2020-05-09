require 'pry'

class Artist
  # extend Memorable
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  extend Findable
  include PARAMABLE
  # include Initialize
  attr_accessor :name
  attr_reader :songs

  @@artists = []

  def self.find_by_name(name)
    @@artists.detect{|a| a.name == name}
  end

  def initialize
    @@artists << self
    super
    @songs = []
  end

  def self.all
    @@artists
  end

  def self.reset_all
    self.all.clear
  end

  def self.count
    @@artists.count
  end

  def add_song(song)
    @songs << song
    song.artist = self
@@ -36,8 +30,4 @@ def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  def to_param
    name.downcase.gsub(' ', '-')
  end

end