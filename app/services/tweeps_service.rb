class TweepsService
  def find_tweets
    HTTPClient.new.request_tweets('estevam.souza@locaweb.com.br')
  end

  def to_hash_array(tweets)
    tweets.map{ |tweet| tweet.to_hash }
  end

  def find_most_relevants
    to_hash_array(SorterService.most_relevant_tweets(find_tweets))
  end

  def find_most_mentions
    tweets_by_mentions = SorterService.most_mentioned_tweets(find_tweets)
    tweets_by_mentions.merge(tweets_by_mentions) do |screen_name, tweets|
      to_hash_array(tweets)
    end
  end
end