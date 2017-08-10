require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  def sorted_tweets?(tweets)
    tweets.each_cons(2).all? do |x,y|
      ([
         (y['followers_count'] <=> x['followers_count']),
         (y['retweet_count'] <=> x['retweet_count']),
         (y['favorite_count'] <=> x['favorite_count'])
       ].detect{|c| c.nonzero?} || 0) <= 0
    end
  end

  test "most_relevants" do
    get "/most_relevants"
    content = JSON.parse((assert_select 'body').to_s.gsub(/<br>/, "\n").gsub(/<\/?body>/, "").html_safe)
    assert_equal content.class, Array
    assert content.all?{|tweet| tweet.class == Hash}
    assert content.all?{|tweet| tweet.key?('screen_name')}
    assert content.all?{|tweet| tweet['screen_name'].class == String}
    assert content.all?{|tweet| tweet.key?('followers_count')}
    assert content.all?{|tweet| tweet['followers_count'].class == Integer}
    assert content.all?{|tweet| tweet.key?('retweet_count')}
    assert content.all?{|tweet| tweet['retweet_count'].class == Integer}
    assert content.all?{|tweet| tweet.key?('favorite_count')}
    assert content.all?{|tweet| tweet['favorite_count'].class == Integer}
    assert content.all?{|tweet| tweet.key?('text')}
    assert content.all?{|tweet| tweet['text'].class == String}
    assert content.all?{|tweet| tweet.key?('created_at')}
    assert content.all?{|tweet| tweet['created_at'].class == String}
    assert content.all?{|tweet| tweet.key?('profile_link')}
    assert content.all?{|tweet| tweet['profile_link'].class == String}
    assert content.all?{|tweet| tweet['profile_link'] == ('https://twitter.com/' + tweet['screen_name'])}
    assert content.all?{|tweet| tweet.key?('link')}
    assert content.all?{|tweet| tweet['link'].class == String}
    assert content.all?{|tweet| tweet['link'].include?('https://twitter.com/' + tweet['screen_name'])}
    assert sorted_tweets?(content)
  end

  test "most_mentions" do
    get "/most_mentions"
    content = JSON.parse((assert_select 'body').to_s.gsub(/<br>/, "\n").gsub(/<\/?body>/, "").html_safe)
    assert_equal content.class, Hash
    assert content.all?{|tweet| tweet.class == Array}
    assert content.all?{|tweet| tweet.key?('screen_name')}
    assert content.all?{|tweet| tweet['screen_name'].class == String}
    assert content.all?{|tweet| tweet.key?('followers_count')}
    assert content.all?{|tweet| tweet['followers_count'].class == Integer}
    assert content.all?{|tweet| tweet.key?('retweet_count')}
    assert content.all?{|tweet| tweet['retweet_count'].class == Integer}
    assert content.all?{|tweet| tweet.key?('favorite_count')}
    assert content.all?{|tweet| tweet['favorite_count'].class == Integer}
    assert content.all?{|tweet| tweet.key?('text')}
    assert content.all?{|tweet| tweet['text'].class == String}
    assert content.all?{|tweet| tweet.key?('created_at')}
    assert content.all?{|tweet| tweet['created_at'].class == String}
    assert content.all?{|tweet| tweet.key?('profile_link')}
    assert content.all?{|tweet| tweet['profile_link'].class == String}
    assert content.all?{|tweet| tweet['profile_link'] == ('https://twitter.com/' + tweet['screen_name'])}
    assert content.all?{|tweet| tweet.key?('link')}
    assert content.all?{|tweet| tweet['link'].class == String}
    assert content.all?{|tweet| tweet['link'].include?('https://twitter.com/' + tweet['screen_name'])}
    assert sorted_tweets?(content)
  end
end
