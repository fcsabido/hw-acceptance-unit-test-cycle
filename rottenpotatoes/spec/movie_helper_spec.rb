require 'rails_helper'

describe MoviesHelper, type: :helper do
  
  context 'When the count is odd' do
    it 'returns "odd" when count is odd' do
        expect(oddness(3)).to eq("odd")
    end
    
    it 'returns "even" when count is even' do
        expect(oddness(4)).to eq("even")
    end
  end
    
end 