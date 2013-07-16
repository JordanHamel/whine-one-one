class WhineController < ApplicationController
  def index
    @trending = []
    scores = {}
    WhineTag.order("created_at DESC").limit(1000).each do |wt|
      if scores[wt.tag_id]
        scores[wt.tag_id] += 1
      else
        scores[wt.tag_id] = 1
      end
    end
    scores = scores.sort_by {|k,v| v}.reverse.first(10)
    scores.each do |s|
      @trending << Tag.find(s[0]).text
    end
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
    if params[:tag] == "all"
      @whine = Whine.all.sample
    else
      tag = Tag.where(:text => params[:tag]).first
      whine_tags = WhineTag.where(:tag_id => tag.id)
      whines = []
      whine_tags.each do |wt|
        whines << Whine.find(wt.whine_id)
      end
      @whine = whines.sample
    end

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
