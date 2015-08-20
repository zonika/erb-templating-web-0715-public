require 'pry'
class Movie
  attr_accessor :title, :release_date, :director, :summary
  @@all = []
  def initialize(title, release_date,director,summary)
    @title = title
    @release_date = release_date
    @director = director
    @summary = summary
    @@all << self
  end

  def url
    @title.downcase.split(" ").join("_") + ".html"
  end

  def self.all
    @@all
  end

  def self.reset_movies!
    @@all = []
  end

  def self.getmovies
    movies = File.open('./spec/fixtures/movies.txt','r')
    m = movies.read.split("\n")
    allmovies = m.map do |movie|
      movie.split(" - ")
    end
  end

  def self.make_movies!
    allmovies = getmovies
    allmovies.each do |movie|
      self.new(movie[0],movie[1].to_i,movie[2],movie[3])
    end
  end

  def self.recent
    @@all.select {|movie| movie if movie.release_date >= 2012}
  end
  def to_html(erb)
    erb.result(binding)
  end
end
