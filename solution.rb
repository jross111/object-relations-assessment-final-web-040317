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

class Rating
  attr_accessor :score
  attr_reader :viewer, :movie

  ALL = []

  def initialize (viewer, movie, score)
    @viewer = viewer
    @score = score
    @movie = movie
    ALL << self
  end


  def self.all
    #Rating.all returns all of the ratings
    ALL
  end

  def viewer
    #Rating#viewer returns the viewer for that given rating
    self.viewer
  end

  def movie
  #Rating#movie returns the movie for that given rating
    self.movie

  end



end


class Movie
  attr_accessor :title
  ALL = []

  def initialize(title)
    self.title = title
    ALL << self
  end

  def self.all
    # + Movie.all returns an array of all movies
    ALL
  end

  def self.find_by_title(title)
    # + Movie.find_by_title(title) given a string of movie title, returns the first movie that matches
    self.all.detect do |movie|
      movie.title = title
    end
  end

  def ratings
    #Movie#ratings returns an array of all ratings for that movie
    Rating.all.find_all do |rating|
      rating.movie == self
    end
  end

  def viewers
    #Movie#viewers should return all of the viewers who have left ratings for that movie.
    self.rating.collect do |rating|
      rating.viewer
    end
  end

  def average_rating
  #  #Movie#average_rating should return the average of all of the scores for the ratings of that particular movie.
   sum = Rating.all.inject(:+)
   sum / Rating.all.length
  end

end
