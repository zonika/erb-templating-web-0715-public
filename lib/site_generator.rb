require 'erb'
class SiteGenerator
  def make_index!
    beginning = "<!DOCTYPE html><html><head><title>Movies</title></head><body><ul>"
    movies = Movie.all
    movies.each do |movie|
      beginning += "<li><a href=\"movies/#{movie.url}\">#{movie.title}</a></li>"
    end
    beginning += "</ul></body></html>"
    File.open('./_site/index.html','w') {|file| file.write(beginning)}
  end
  def generate_pages!
    template = File.read('./lib/templates/movie.html.erb')
    erb = ERB.new(template)
    Movie.all.each do |movie|
      File.open("./_site/movies/#{movie.url}","w+") {|f| f.puts movie.to_html(erb)}
    end
  end
end
