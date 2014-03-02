class StaticController < ApplicationController
  def demo
  	@comments = Comment.order("updated_at DESC")
  	@comment = Comment.new
  end

  def info
  end
end
