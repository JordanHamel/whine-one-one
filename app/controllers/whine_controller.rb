class WhineController < ApplicationController
  def index
  end

  def new
    @whine = Whine.new
    @tagline = TAGLINES.sample
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

  TAGLINES = [
    "Pour your heart out without losing any Facebook friends.",
    "The wahhmbulance is on it's way.",
    "Hopefully the internet peoples will listen.",
    "Whining encouraged.",
  ]
end
