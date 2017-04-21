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
