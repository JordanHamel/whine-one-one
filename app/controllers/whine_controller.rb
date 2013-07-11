class WhineController < ApplicationController
  def index
  end

  def new
    @whine = Whine.new
  end

  def create
    Whine.create(:message => params[:message])
    redirect_to root_path
  end
end
