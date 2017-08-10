require 'rails_helper'

describe SorterService do
  it 'chooses eligible tweets correctly' do
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
      'in_reply_to_user_id' => 42,
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
      'text' => 'Ola @locaweb!',
      'created_at' => 'Mon Sep 24 03:35:21 +0000 2012',
      'in_reply_to_user_id' => 200,
      'entities' => {
        'user_mentions' => [
          {'id' => 42}
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
      'in_reply_to_user_id' => 42,
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
    tweets = [tweet_1, tweet_2, tweet_3, tweet_4, tweet_5]
    expect(SorterService.send(:get_eligible, tweets)).to eq([tweet_1, tweet_3, tweet_5])
  end

  it 'sorts by relevance correctly' do
    tweet_hash_1 = {
      'id' => 10000,
      'user' => {
        'screen_name' => 'john_doe',
        'followers_count' => 80
      },
      'retweet_count' => 50,
      'favorite_count' => 30,
      'text' => 'Ola @mary!',
      'created_at' => 'Mon Sep 24 03:35:21 +0000 2012',
      'in_reply_to_user_id' => 42,
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
        'followers_count' => 90
      },
      'retweet_count' => 100,
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
        'followers_count' => 100
      },
      'retweet_count' => 10,
      'favorite_count' => 5,
      'text' => 'Ola @locaweb!',
      'created_at' => 'Mon Sep 24 03:35:21 +0000 2012',
      'in_reply_to_user_id' => 200,
      'entities' => {
        'user_mentions' => [
          {'id' => 42}
        ]
      }
    }
    tweet_hash_4 = {
      'id' => 40000,
      'user' => {
        'screen_name' => 'erick_doe',
        'followers_count' => 80
      },
      'retweet_count' => 50,
      'favorite_count' => 30,
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
        'followers_count' => 100
      },
      'retweet_count' => 10,
      'favorite_count' => 20,
      'text' => 'Ola @mary!',
      'created_at' => 'Mon Sep 24 03:35:21 +0000 2012',
      'in_reply_to_user_id' => 42,
      'entities' => {
        'user_mentions' => [
          {'id' => 43}
        ]
      }
    }
    tweet_hash_6 = {
      'id' => 60000,
      'user' => {
        'screen_name' => 'olivia_doe',
        'followers_count' => 150
      },
      'retweet_count' => 0,
      'favorite_count' => 2,
      'text' => 'Ola @mary!',
      'created_at' => 'Mon Sep 24 03:35:21 +0000 2012',
      'in_reply_to_user_id' => 42,
      'entities' => {
        'user_mentions' => [
          {'id' => 43}
        ]
      }
    }
    tweet_hash_7 = {
      'id' => 70000,
      'user' => {
        'screen_name' => 'olivia_doe',
        'followers_count' => 150
      },
      'retweet_count' => 20,
      'favorite_count' => 60,
      'text' => 'Ola @mary!',
      'created_at' => 'Mon Sep 24 03:35:21 +0000 2012',
      'in_reply_to_user_id' => 42,
      'entities' => {
        'user_mentions' => [
          {'id' => 43}
        ]
      }
    }
    tweet_hash_8 = {
      'id' => 80000,
      'user' => {
        'screen_name' => 'olivia_doe',
        'followers_count' => 10
      },
      'retweet_count' => 1000,
      'favorite_count' => 1000,
      'text' => 'Ola @mary!',
      'created_at' => 'Mon Sep 24 03:35:21 +0000 2012',
      'in_reply_to_user_id' => 42,
      'entities' => {
        'user_mentions' => [
          {'id' => 43}
        ]
      }
    }
    tweet_hash_9 = {
      'id' => 90000,
      'user' => {
        'screen_name' => 'olivia_doe',
        'followers_count' => 11
      },
      'retweet_count' => 1,
      'favorite_count' => 1,
      'text' => 'Ola @mary!',
      'created_at' => 'Mon Sep 24 03:35:21 +0000 2012',
      'in_reply_to_user_id' => 42,
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
    tweet_6 = Tweet.new(tweet_hash_6)
    tweet_7 = Tweet.new(tweet_hash_7)
    tweet_8 = Tweet.new(tweet_hash_8)
    tweet_9 = Tweet.new(tweet_hash_9)
    tweets = [tweet_1, tweet_2, tweet_3, tweet_4, tweet_5, tweet_6, tweet_7, tweet_8, tweet_9]
    expect(SorterService.send(:sort_by_relevance, tweets)).to eq([tweet_7, tweet_6, tweet_5, tweet_3, tweet_2, tweet_1, tweet_4, tweet_9, tweet_8])
  end

  it 'sorts by mentions correctly' do
    tweet_hash_1 = {
      'id' => 10000,
      'user' => {
        'screen_name' => 'peter_doe',
        'followers_count' => 200
      },
      'retweet_count' => 50,
      'favorite_count' => 50,
      'text' => 'Ola @mary!',
      'created_at' => 'Mon Sep 24 03:35:21 +0000 2012',
      'in_reply_to_user_id' => 42,
      'entities' => {
        'user_mentions' => [
          {'id' => 43}
        ]
      }
    }
    tweet_hash_2 = {
      'id' => 20000,
      'user' => {
        'screen_name' => 'peter_doe',
        'followers_count' => 200
      },
      'retweet_count' => 100,
      'favorite_count' => 30,
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
      'id' => 40000,
      'user' => {
        'screen_name' => 'mary_skywalker',
        'followers_count' => 100
      },
      'retweet_count' => 10,
      'favorite_count' => 5,
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
      'id' => 50000,
      'user' => {
        'screen_name' => 'mary_skywalker',
        'followers_count' => 100
      },
      'retweet_count' => 10,
      'favorite_count' => 10,
      'text' => 'Ola @mary!',
      'created_at' => 'Mon Sep 24 03:35:21 +0000 2012',
      'in_reply_to_user_id' => 42,
      'entities' => {
        'user_mentions' => [
          {'id' => 43}
        ]
      }
    }
    tweet_hash_5 = {
      'id' => 30000,
      'user' => {
        'screen_name' => 'jon_skywalker',
        'followers_count' => 150
      },
      'retweet_count' => 10,
      'favorite_count' => 5,
      'text' => 'Ola @locaweb!',
      'created_at' => 'Mon Sep 24 03:35:21 +0000 2012',
      'in_reply_to_user_id' => 200,
      'entities' => {
        'user_mentions' => [
          {'id' => 42}
        ]
      }
    }
    tweet_1 = Tweet.new(tweet_hash_1)
    tweet_2 = Tweet.new(tweet_hash_2)
    tweet_3 = Tweet.new(tweet_hash_3)
    tweet_4 = Tweet.new(tweet_hash_4)
    tweet_5 = Tweet.new(tweet_hash_5)
    tweets = [tweet_1, tweet_2, tweet_3, tweet_4, tweet_5]
    expect(SorterService.send(:sort_by_mentions, tweets))
      .to eq(
        {
          'peter_doe' => [tweet_2, tweet_1],
          'jon_skywalker' => [tweet_5],
          'mary_skywalker' => [tweet_4, tweet_3]
        }
      )
  end
end