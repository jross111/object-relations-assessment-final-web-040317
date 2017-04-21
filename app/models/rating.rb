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
