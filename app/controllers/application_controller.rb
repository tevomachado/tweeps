class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include HTTParty

  def index
  end

  def most_relevants
    response =
      HTTParty.get(
        "http://tweeps.locaweb.com.br/tweeps",
        headers: {Username: 'estevam.souza@locaweb.com.br'})
    response_hash = JSON.parse(response.body)
    tweets = response_hash['statuses']
    eligible_tweets = tweets.select do |tweet|
      tweet['in_reply_to_user_id'] == 42 ||
      tweet['entities']['user_mentions'].any? do |user|
        user['id'] == 42
      end
    end
    cleaned_tweets = eligible_tweets.map do |tweet|
      screen_name = tweet['user']['screen_name']
      {
        'screen_name' => screen_name,
        'followers_count' => tweet['user']['followers_count'],
        'retweet_count' => tweet['retweet_count'],
        'favorite_count' => tweet['favorite_count'],
        'text' => tweet['text'],
        'created_at' => tweet['created_at'],
        'profile_link' => 'https://twitter.com/' + screen_name,
        'link' => 'https://twitter.com/' + screen_name + '/status/' + tweet['id'].to_s,
      }
    end
    @sorted_tweets = cleaned_tweets.sort do |x,y|
      if x['followers_count'] > y['followers_count']
        -1
      elsif x['followers_count'] < y['followers_count']
        1
      else
        if x['retweet_count'] > y['retweet_count']
          -1
        elsif x['retweet_count'] < y['retweet_count']
          1
        else
          if x['favorite_count'] > y['favorite_count']
            -1
          elsif x['favorite_count'] < y['favorite_count']
            1
          else
            0
          end
        end
      end
    end
  end

  def most_mentions
    @grouped_tweets = most_relevants.group_by{|x| x['screen_name']}
  end

end
