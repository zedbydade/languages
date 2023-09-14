# Background:
# The following code works but I have intentionally introduced issues to make it inefficient.
# UserEvents are created for every interaction a user has in the system. It stores what employer, partner and 
# controller they were on. When there were 10 users and only a little bit of traffic, this would run quickly.
# But now with 10,000 users and months of traffic - (millions of user events), this code would be very inefficient.

# Instructions:
# 1. Please make this code more efficient through refactoring so that it can run at a greater scale, 
#    along with adding some comments to improve the readability.
# 2. Please explain what the variable 'distinct_groups' will contain by the end of the execution and what
#    this data would be useful for.
# 3. Send the resulting file as a gist, .rb file or zip package via email to ryan@zevobenefits.com


start_range = Date.today.beginning_of_month
end_range = Date.today.end_of_month

users = User.where(role: role)

employers = []
partners = []
controller_resources = []

distinct_groups = {}

users.each do |user|
  time = 0
  last_time = nil
  times = []
  user_name = nil
  users_events = user.user_events.to_a
  user_events_filtered = user_events.select{|x| x.created_at >= start_range && x.created_at <= end_range }
  user_events_filtered.sort_by{|x| x.created_at }.each do |event|
    user_name = event.user_name
    if event.last_known_session.present?
      employers << event.last_known_session["employer"]
      partners << event.last_known_session["partner"]
    end
    controller_resources << event.data["params"]["controller"]
    if last_time.nil? || last_time+10.minutes < event.created_at
      times << time
      time = 0
      last_time = event.created_at
    else
      time += event.created_at - last_time
      last_time = event.created_at
    end
  end
  times << time
  sum = times.reduce(:+)
  distinct_groups[user_name] = sum
end
