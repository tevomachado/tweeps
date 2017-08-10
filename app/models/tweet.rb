class Tweet
  TWITTER_HOME = 'https://twitter.com/'
  STATUS_PATH = '/status/'
  LOCAWEB_USER_ID = 42

  attr_accessor :id, :screen_name, :followers_count, :retweet_count, :favorite_count, :text, :created_at, :in_reply_to_user_id, :user_mentions

  def initialize(tweet_hash)
    @id = tweet_hash['id']
    @screen_name = tweet_hash['user']['screen_name']
    @followers_count = tweet_hash['user']['followers_count']
    @retweet_count = tweet_hash['retweet_count']
    @favorite_count = tweet_hash['favorite_count']
    @text = tweet_hash['text']
    @created_at = tweet_hash['created_at']
    @in_reply_to_user_id = tweet_hash['in_reply_to_user_id']
    @user_mentions = tweet_hash['entities']['user_mentions'].map{ |user| user['id'] }
  end

  def to_locaweb?
    @in_reply_to_user_id == LOCAWEB_USER_ID || @user_mentions.include?(LOCAWEB_USER_ID)
  end

  def to_hash
    {
      'screen_name' => @screen_name,
      'followers_count' => @followers_count,
      'retweet_count' => @retweet_count,
      'favorite_count' => @favorite_count,
      'text' => @text,
      'created_at' => @created_at,
      'profile_link' => TWITTER_HOME + @screen_name,
      'link' => TWITTER_HOME + @screen_name + STATUS_PATH + @id.to_s
    }
  end

  def to_json
    JSON.generate(self.to_hash)
  end

  def <=>(another_tweet)
    [
      (another_tweet.followers_count <=> self.followers_count),
      (another_tweet.retweet_count <=> self.retweet_count),
      (another_tweet.favorite_count <=> self.favorite_count)
    ].detect{|comparison_result| comparison_result.nonzero?} || 0
  end
end