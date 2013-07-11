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

  def pick_whine
    @whine = Whine.all.sample

    respond_to do |format|
      format.json { render json: @whine }
    end
  end
end
