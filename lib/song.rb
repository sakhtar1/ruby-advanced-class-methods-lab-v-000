class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create
    song = self.new
    song.save
    song
  end

  def Song.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def Song.create_by_name(name)
    #Build a class constructor Song.create_by_name that takes in the string
    #name of a song and returns a song
    #instance with that name set as its name property and the song being
    #saved into the @@all class variable.
    song = self.new
    song.name = name
    song.save
    song
  end

  def Song.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def Song.find_or_create_by_name(name)
#accept a string name for a song and either return a matching song instance
# with that name or create a new song with the name and return the song instance.
    if Song.find_by_name(name) == nil
      Song.create_by_name(name)
    else
      Song.find_by_name(name)
    end
  end

  def Song.alphabetical
    @@all.sort_by!{ |song| song.name.downcase}
  end

  def Song.new_from_filename(file)
  mp3 = self.new
  mp3.name = file.split(/[^a-zA-Z\s]|\s-\s/)[1]
  mp3.artist_name = file.split(/[a-zA-Z\s]|\s-\s/)[0]
  mp3
  end

  def Song.create_from_filename(file)
    
  end

  def Song.destroy_all
    @@all.clear
  end


end
