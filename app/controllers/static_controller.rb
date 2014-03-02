class StaticController < ApplicationController
  def demo
  	@comments = Comment.order("updated_at DESC")
  	@comment = Comment.new
  	@images = []
  	(0..9).map{ |i| i }.each do |n|
  		@images << "u#{n}.png"
  		@images << "p#{n}.png"
  	end
  end

  def info
  end
end
