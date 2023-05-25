SELECT tweets.*, users.* FROM tweets 
  JOIN users ON tweets.sender_id = users.id 
  JOIN follows ON follows.followee_id = users.id 
  WHERE follows.follower_id = current_user
