class Viewer
  attr_accessor :first_name, :last_name

  ALL = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    ALL << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    # + Viewer.all should return all of the viewers
    ALL
  end

  def self.find_by_name(name)
      # Viewer.find_by_name(name) given a string of a full name, returns the first customer whose
    self.all.detect do |viewer|
      viewer.full_name == name
    end
  end

  def create_rating(movie, score)
      #Viewer create_rating given a score and a movie, creates a new Rating and associates it with that viewer and that movie
    Rating.new(self, movie, score)
  end
end
