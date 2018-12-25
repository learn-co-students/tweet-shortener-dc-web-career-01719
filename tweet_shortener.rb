require 'pry'

def dictionary
   {"hello" => "hi",
       "be" => "b",
       "you" => "u",
       "at" => "@",
       "and" => "&",
       "to" => "2",
       "two"=> "2",
       "too" => "2",
       "for" => "4",
       "four" => "4"}
end

def transform_keys(hash)
   new_hash = {}
    hash.each_pair do |key, value|
        new_hash[yield(key)] = value
    end
    new_hash
end

def word_substituter(tweet)
    dic = dictionary
#            binding.pry

    dic_cap = transform_keys(dic) {|key| key.capitalize}

    dic_arr = dictionary.keys
    dic_cap_arr = dic_cap.keys
#
#    
    tweet_arr = tweet.split
    
    tweet_arr.collect!.with_index do |name, index|
        if dic_arr.include?(name)
            dic[name]
        elsif dic_cap_arr.include?(name)
            dic_cap[name]
        else name
        end
    end
    tweet_update = tweet_arr.join(" ")
    tweet_update
end

def bulk_tweet_shortener(tweet_arr)
   tweet_arr.each do |tweet|
        puts word_substituter(tweet)
   end
end

def selective_tweet_shortener(tweet)
   if tweet.length > 140
       word_substituter(tweet)
   else tweet
   end
end

def shortened_tweet_truncator(tweet)
   new_tweet = selective_tweet_shortener(tweet)
   if new_tweet.length > 140
       new_tweet[0..139]
   else new_tweet
   end
end