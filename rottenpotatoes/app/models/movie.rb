class Movie < ActiveRecord::Base
  
  # Defining the class method similar_movies  
  def self.similar_movies movie_title
    result = Movie.find_by(title: movie_title)
    
    if result.nil? or result[:director].blank?
        return nil
    end
    
    # Note: using pluck to get only :title attributes of the result
    return Movie.where(director: result[:director]).pluck(:title)
  end
    
end
