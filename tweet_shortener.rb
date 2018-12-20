# Write your code here.
def dictionary(word)
  dict = {
    "hello" => 'hi' ,
    "to" => '2' ,
    "two" => '2' ,
    "too" => '2' ,
    "for" => '4' ,
    "four" => '4',
    "be" => 'b' ,
    'you' => 'u' ,
    "at" => '@' ,
    "and" => '&'
  }
  if dict[word.downcase]
    dict[word.downcase]
  else
    word
  end
end

def word_substituter(string)
  string = string.split(' ')
  new_string = ''
  string.each do |word|
    new_word = dictionary(word)
    new_string += "#{new_word} "
  end
  new_string = new_string.slice(0... -1)
  new_string
end

def bulk_tweet_shortener(tweets)
  tweets.each do |tweet|
    tweet = word_substituter(tweet)
    puts tweet
  end
end

def selective_tweet_shortener(tweet)
  if tweet.length > 140
    tweet = word_substituter(tweet)
  else
    tweet
  end
end

def shortened_tweet_truncator(tweet)
  tweet = tweet.slice(0, 140)
end


