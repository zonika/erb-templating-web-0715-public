require 'spec_helper'

describe 'Movie' do
  let(:title) { 'The Matrix' }
  let(:release_date) { 1999 }
  let(:director) { 'The Wachowski Brothers' }
  let(:summary) { 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.' }
  let(:movie) { Movie.new(title, release_date, director, summary) }

  context 'attributes' do
    it 'has a title' do
      expect(movie.title).to eq(title)
    end

    it 'has a release date' do
      expect(movie.release_date).to eq(release_date)
    end

    it 'has a director' do
      expect(movie.director).to eq(director)
    end

    it 'has a summary' do
      expect(movie.summary).to eq(summary)
    end
  end
end