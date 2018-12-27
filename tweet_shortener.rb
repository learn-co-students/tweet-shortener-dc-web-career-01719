# Write your code here.
def dictionary
  dictionary = {
    "hello" => "hi",
    "to" => "2",
    "two" => "2",
    "too" => "2",
    "for" => "4",
    "four" => "4",
    "you" => "u",
    "at" => "@",
    "and" => "&",
    "be" => "b"
  }
end

def word_substituter(tweet)
  tweet.split.collect { |word|
    dictionary.keys.include?(word.downcase) ? word = dictionary[word.downcase] : word
  }.join(" ")
end

def bulk_tweet_shortener(tweets_array)
  tweets_array.collect { |tweet| puts word_substituter(tweet) }
end

def selective_tweet_shortener(tweet)
  if tweet.size > 140
    word_substituter(tweet)
  else
    tweet
  end
end

def shortened_tweet_truncator(tweet)
  truncated_tweet = ""
  if word_substituter(tweet).size > 140
    truncated_tweet = word_substituter(tweet)[0..136] + "..."
  else
    truncated_tweet = word_substituter(tweet)
  end
end
