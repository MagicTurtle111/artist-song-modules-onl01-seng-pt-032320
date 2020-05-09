require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist

  @@songs = []

  def initialize
    @@songs << self
  end

  def self.find_by_name(name)
    @@songs.detect{|a| a.name == name}
  end

  def artist=(artist)
    @artist = artist
  end
  # extend Memorable
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  extend Findable
  include PARAMABLE
  attr_accessor :name, :artist

  def self.reset_all
    @@songs.clear
  end

  def to_param
    name.downcase.gsub(' ', '-')
  end

  def self.count
    self.all.count
  end
  @@songs = []

  def self.all
    @@songs
  end

end