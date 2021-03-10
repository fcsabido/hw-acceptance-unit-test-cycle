require 'rails_helper'

describe MoviesController, :type => :request do

    describe 'When the specified movie has a director' do
      it 'should redirect to similar_movies path and contain movies with same director' do
        @movie1 = Movie.create(:id => "1", title: "Tantan", director: "John Doe")
        @movie2 = Movie.create(:id => "2", title: "Tenten", director: "John Doe")
        @movie3 = Movie.create(:id => "3", title: "Tintin", director: "John Deer")

        get "/similar_movies/Tantan"
        expect(response).to be_successful
        expect(response.body).to include(@movie1.title)
        expect(response.body).to include(@movie2.title)
        expect(response.body).not_to include(@movie3.title)
      end
    end
    
    describe 'When the specified movie has no director' do
      it 'should redirect to movies path' do
        @movie1 = Movie.create(:id => "1", title: "Undirected movie")
        get similar_movies_path(@movie1.title)
        expect(response).to redirect_to(movies_path)
      end
    end
    
  end