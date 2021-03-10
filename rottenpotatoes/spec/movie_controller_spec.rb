require 'rails_helper'

describe MoviesController, :type => :controller do

    describe 'When the specified movie has a director' do
      it 'should redirect to similar_movies path and contain movies with same director' do
        @movie1 = Movie.create(:id => "1", title: "Tantan", director: "John Doe")
        @movie2 = Movie.create(:id => "2", title: "Tenten", director: "John Doe")

        get :similar_movies, title: @movie1.title 
        expect(response).to be_successful
      end
    end
    
    describe 'When the specified movie has no director' do
      it 'should redirect to movies path' do
        @movie1 = Movie.create(:id => "1", title: "Undirected movie")
        get :similar_movies, title: @movie1.title
        expect(response).to redirect_to(movies_path)
      end
    end
    
    describe 'When creating a movie' do

      let(:params) {{:title => "Tantan", :rating => "PG", :director => "John Doe"}}

      it 'calls the create method to create a new movie' do
        post :create, {movie: params}
        expect(Movie.count).to eq(1)
      end
    end
      
      
    describe "destroy" do
      let(:params) {{:title => "Tantan", :rating => "PG", :director => "John Doe"}}
        
      it 'calls the find method to retrieve a movie' do
        # Adding a Movie using :create
        post :create, {movie: params}
        expect(Movie.count).to eq(1)
        
        # Get the parameters of the movie we just added
        parameters = Movie.find_by(title: params[:title])
        
        delete :destroy, {id: parameters[:id]}
        expect(Movie.count).to eq(0)

      end
    end
      
      
  end