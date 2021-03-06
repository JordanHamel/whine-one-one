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
        next unless t.match(/^[-_a-z0-9]+$/)
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

  def all_whines
    @whines = Whine.all.reverse

    respond_to do |format|
      format.json { render json: @whines }
    end
  end

  def get_tags
    if params[:whine]
      if whine = Whine.find(params[:whine])
        @tags = whine.tags

        respond_to do |format|
          format.json { render json: @tags }
        end
      end
    end
  end

  def trending_whines
    tag = Tag.where(:text => params[:tag]).first
    whine_tags = WhineTag.where(:tag_id => tag.id)
    @whines = []
    whine_tags.each do |wt|
      @whines << Whine.find(wt.whine_id)
    end

    respond_to do |format|
      format.json { render json: @whines }
    end
  end

  TAGLINES = [
    "Pour your heart out without losing any Facebook friends.",
    "The wahhmbulance is on it's way.",
    "Hopefully the internet peoples will listen.",
    "Whining encouraged.",
    "So you\'re telling me you had a bad day?",
    "It couldn\'t get any worse, could it?",
    "Share a whine, save a live",
    "Sad to think people will laugh at this, eh?",
  ]
end
