class TagController < ApplicationController
  def show
    matches = Tag.where(:text => params[:tag])
    if matches.length > 0
      @tag = matches.first
    else
      @text = params[:tag]
    end
  end
end
