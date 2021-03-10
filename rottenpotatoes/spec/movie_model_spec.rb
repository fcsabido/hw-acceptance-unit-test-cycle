require 'rails_helper'

describe Movie do
  
  context 'it should return the correct matches for movies by the same director' do
    it 'finds movies with the same director' do
      @movie1 = Movie.create(:id => "1", title: "Tantan", director: "John Doe")
      @movie2 = Movie.create(:id => "2", title: "Tintin", director: "John Doe")
      results = Movie.similar_movies(@movie1.title)
      expect(results).to eq([@movie1.title, @movie2.title])
    end        
  end    

  context 'it should not return matches of movies by different directors' do
    it 'finds no other movies with same director' do
      @movie1 = Movie.create(:id => "1", title: "Tenten", director: "John Doe")
      @movie2 = Movie.create(:id => "2", title: "Tonton", director: "John Deer")
      results = Movie.similar_movies(@movie1.title)
      expect(results).to eq([@movie1.title])
    end
  end
end