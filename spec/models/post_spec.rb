require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validation test' do
    it 'ensures content presence' do
      post = Post.new(content: ' ').save
      expect(post).to eq(false)
    end
  end 
end
