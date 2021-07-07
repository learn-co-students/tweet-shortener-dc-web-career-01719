def dictionary 
  dictionary = {
    "hello"=>"hi",
"to" => '2' ,
"too" => "2",
"two" => "2",
"for" =>  '4',
"four" => '4',
'be' => 'b',
'you' => 'u',
"at" => "@",
"and" => "&"
 } 
end

def word_substituter(tweet)
  tweet.split.map {|word| 
  if dictionary.keys.include?(word.downcase)
   word = dictionary[word.downcase]
 else 
   word
  end
  }.join(" ")
end

def bulk_tweet_shortener(tweets)
  tweets.each {|tweet|
  puts word_substituter(tweet)
  }
  end
  
def selective_tweet_shortener(tweet)
  if tweet.size <141
    tweet
  else 
  word_substituter(tweet)
end
end

def shortened_tweet_truncator(tweet)
if tweet.size > 140 
"#{tweet[0...137]}..."
else 
  tweet
end
end