messages = [
  "The line for ice cream sandwiches is an hour long!",
  "Bus is late again. When is this city ever gonna get it right?",
  "I can\'t believe my bike got stolen! This town is supposed to have a LOW crime rate!",
  "I really really really wish I could have a dog in my apartment. Why can\'t my landlord understand?",
  "Fruit flies. Fruit flies everywhere.",
  "I just vaccumed the carpet yesterday, and BOOM! Girl hair! I\'m pretty sure I\'m dating a dog...",
  "My waterbottle leaked in my purse and now my phone is broken :(",
  "A LEAFBLOWER WOKE ME UP THIS MORNING!!!",
  "The kitchen is so dirty, I walk all the way around the house to avoid it.",
  "My boyfriend just broke up with me.",
  "My girlfiend just dumped my for my best friend",
  "My toes always get cold in my snuggie. I wish they made snuggies with foot pockets.",
  "My hands are too dry to turn the pages of this book. I also burnt my tounge with hot chocolate.",
  "My dad lied to me. He said the ice cream was good and good for you. Now I\'m overweight.",
]

tags = [
  "ridiculous",
  "ice cream",
  "bus",
  "long wait",
  "ridiculous",
  "stolen",
  "puppy deprived",
  "apartment living",
  "bugs",
  "apartment living",
  "hair",
  "apartment living",
  "ridiculous",
  "wet phone",
  "leafblower",
  "apartment living",
  "dirty dishes",
  "apartment living",
  "forever alone",
  "broken heart",
  "broken heart",
  "bitch",
  "snuggie",
  "too cold",
  "too hot",
  "burnt tongue",
  "liar",
  "ridiculous",
]

tags.each do |t|
  next if Tag.where(:text => t).length > 0
  Tag.create(:text => t)
end

i = 0
messages.each do |m|
  if whine = Whine.create(:message => m)
    tag1 = Tag.where(:text => tags[i]).first
    tag2 = Tag.where(:text => tags[i+1]).first
    WhineTag.create(:whine_id => whine.id, :tag_id => tag1.id)
    WhineTag.create(:whine_id => whine.id, :tag_id => tag2.id)
  end

  i += 2
end
