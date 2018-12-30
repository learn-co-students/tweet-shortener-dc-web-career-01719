
def dictionary
  
  {
    "hello" => 'hi',
    "to" => '2',
    "two" => '2',
    "too" => '2',
    "for" => '4',
    "four" => '4',
    "be" => 'b',
    "you" => 'u',
    "at" => '@',
    "and" => '&'
  }
  
end

def word_substituter(tweet)
  tweet_a = tweet.split
  tweet_a.each_with_index do |word, index|
    tweet_a[index] = dictionary[word] if dictionary.keys.find {|key| key == word}
    tweet_a[index] = dictionary[word.downcase].capitalize if dictionary.keys.find {|key| key.capitalize == word}
  end
  tweet_a.join(" ")
end

def bulk_tweet_shortener(tweets)
  tweets.each do |tweet|
    puts word_substituter(tweet)
  end
end

def selective_tweet_shortener(tweet)
  tweet.length < 140 ? tweet : word_substituter(tweet)
end

def shortened_tweet_truncator(tweet)
  if tweet.length < 140
    tweet
  else
    if word_substituter(tweet).length < 140
      word_substituter(tweet)
    else
      word_substituter(tweet)[0,137] + "..."
    end
  end
end
