require 'rails_helper'

describe Tweet do
  it 'sets its attributes correctly' do
    tweet = Tweet.new(
      'id' => 10000,
      'user' => {
        'screen_name' => 'john_doe',
        'followers_count' => 100
      },
      'retweet_count' => 30,
      'favorite_count' => 50,
      'text' => 'Ola @locaweb!',
      'created_at' => 'Mon Sep 24 03:35:21 +0000 2012',
      'in_reply_to_user_id' => 200,
      'entities' => {
        'user_mentions' => [
          {'id' => 42}
        ]
      }
    )
    expect(tweet.id).to eq(10000)
    expect(tweet.screen_name).to eq('john_doe')
    expect(tweet.followers_count).to eq(100)
    expect(tweet.retweet_count).to eq(30)
    expect(tweet.favorite_count).to eq(50)
    expect(tweet.text).to eq('Ola @locaweb!')
    expect(tweet.created_at).to eq('Mon Sep 24 03:35:21 +0000 2012')
    expect(tweet.in_reply_to_user_id).to eq(200)
    expect(tweet.user_mentions).to eq([42])
  end

  it 'is to locaweb' do
    tweet = Tweet.new(
      'id' => 10000,
      'user' => {
        'screen_name' => 'john_doe',
        'followers_count' => 100
      },
      'retweet_count' => 30,
      'favorite_count' => 50,
      'text' => 'Ola @locaweb!',
      'created_at' => 'Mon Sep 24 03:35:21 +0000 2012',
      'in_reply_to_user_id' => 200,
      'entities' => {
        'user_mentions' => [
          {'id' => 42}
        ]
      }
    )
    expect(tweet).to be_to_locaweb
  end

  it 'is not to locaweb' do
    tweet = Tweet.new(
      'id' => 10000,
      'user' => {
        'screen_name' => 'john_doe',
        'followers_count' => 100
      },
      'retweet_count' => 30,
      'favorite_count' => 50,
      'text' => 'Ola @mary!',
      'created_at' => 'Mon Sep 24 03:35:21 +0000 2012',
      'in_reply_to_user_id' => 200,
      'entities' => {
        'user_mentions' => [
          {'id' => 43}
        ]
      }
    )
    expect(tweet).not_to be_to_locaweb
  end

  it 'returns a hash with its attributes' do
    tweet_hash = {
      'id' => 10000,
      'user' => {
        'screen_name' => 'john_doe',
        'followers_count' => 100
      },
      'retweet_count' => 30,
      'favorite_count' => 50,
      'text' => 'Ola @mary!',
      'created_at' => 'Mon Sep 24 03:35:21 +0000 2012',
      'in_reply_to_user_id' => 200,
      'entities' => {
        'user_mentions' => [
          {'id' => 43}
        ]
      }
    }
    tweet = Tweet.new(tweet_hash)
    expect(tweet.to_hash).to eq({
      'screen_name' => 'john_doe',
      'followers_count' => 100,
      'retweet_count' => 30,
      'favorite_count' => 50,
      'text' => 'Ola @mary!',
      'created_at' => 'Mon Sep 24 03:35:21 +0000 2012',
      'profile_link' => 'https://twitter.com/john_doe',
      'link' => 'https://twitter.com/john_doe/status/10000'
    })
  end

  it 'correctly compares itself with another tweet' do
    tweet_hash_1 = {
      'id' => 10000,
      'user' => {
        'screen_name' => 'john_doe',
        'followers_count' => 200
      },
      'retweet_count' => 40,
      'favorite_count' => 50,
      'text' => 'Ola @mary!',
      'created_at' => 'Mon Sep 24 03:35:21 +0000 2012',
      'in_reply_to_user_id' => 100,
      'entities' => {
        'user_mentions' => [
          {'id' => 43}
        ]
      }
    }
    tweet_hash_2 = {
      'id' => 20000,
      'user' => {
        'screen_name' => 'mary_doe',
        'followers_count' => 100
      },
      'retweet_count' => 30,
      'favorite_count' => 50,
      'text' => 'Ola @mary!',
      'created_at' => 'Mon Sep 24 03:35:21 +0000 2012',
      'in_reply_to_user_id' => 200,
      'entities' => {
        'user_mentions' => [
          {'id' => 43}
        ]
      }
    }
    tweet_hash_3 = {
      'id' => 30000,
      'user' => {
        'screen_name' => 'peter_doe',
        'followers_count' => 200
      },
      'retweet_count' => 30,
      'favorite_count' => 50,
      'text' => 'Ola @mary!',
      'created_at' => 'Mon Sep 24 03:35:21 +0000 2012',
      'in_reply_to_user_id' => 200,
      'entities' => {
        'user_mentions' => [
          {'id' => 43}
        ]
      }
    }
    tweet_hash_4 = {
      'id' => 40000,
      'user' => {
        'screen_name' => 'erick_doe',
        'followers_count' => 200
      },
      'retweet_count' => 30,
      'favorite_count' => 40,
      'text' => 'Ola @mary!',
      'created_at' => 'Mon Sep 24 03:35:21 +0000 2012',
      'in_reply_to_user_id' => 200,
      'entities' => {
        'user_mentions' => [
          {'id' => 43}
        ]
      }
    }
    tweet_hash_5 = {
      'id' => 50000,
      'user' => {
        'screen_name' => 'olivia_doe',
        'followers_count' => 200
      },
      'retweet_count' => 30,
      'favorite_count' => 40,
      'text' => 'Ola @mary!',
      'created_at' => 'Mon Sep 24 03:35:21 +0000 2012',
      'in_reply_to_user_id' => 200,
      'entities' => {
        'user_mentions' => [
          {'id' => 43}
        ]
      }
    }
    tweet_1 = Tweet.new(tweet_hash_1)
    tweet_2 = Tweet.new(tweet_hash_2)
    tweet_3 = Tweet.new(tweet_hash_3)
    tweet_4 = Tweet.new(tweet_hash_4)
    tweet_5 = Tweet.new(tweet_hash_5)
    expect(tweet_1 <=> tweet_2).to eq(-1)
    expect(tweet_2 <=> tweet_1).to eq(1)
    expect(tweet_1 <=> tweet_3).to eq(-1)
    expect(tweet_3 <=> tweet_1).to eq(1)
    expect(tweet_3 <=> tweet_4).to eq(-1)
    expect(tweet_4 <=> tweet_3).to eq(1)
    expect(tweet_1 <=> tweet_1).to eq(0)
    expect(tweet_2 <=> tweet_2).to eq(0)
    expect(tweet_3 <=> tweet_3).to eq(0)
    expect(tweet_4 <=> tweet_4).to eq(0)
    expect(tweet_4 <=> tweet_5).to eq(0)
  end
end