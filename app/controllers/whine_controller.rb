class WhineController < ApplicationController
  def index
  end

  def new
    @whine = Whine.new
    @tagline = TAGLINES.sample
  end

  def create
    if whine = Whine.create(:message => params[:message])
      tags = params[:tags].split(',')
      tags.each do |t|
        t = t.strip.downcase
        existing_tag = Tag.where(:text => t)
        if existing_tag.length == 0
          tag = Tag.create(:text => t)
          WhineTag.create(
            :whine_id => whine.id,
            :tag_id => tag.id
          )
        else
          WhineTag.create(
            :whine_id => whine.id,
            :tag_id => existing_tag.first.id
          )
        end
      end
    end

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
