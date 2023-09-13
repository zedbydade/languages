START_RANGE = Date.today.beginning_of_month
END_RANGE = Date.today.end_of_month

@employers = {}
@partners = {}
@controller_resources = {}
@distinct_groups = {}

# Doing eager preload because of n+1 problems
users = User.where(role: role).includes(:user_events)
user.each(&:event_data)

def event_data(user) 
  time = 0
  last_event_created_at = 0
  # With the index at created_at collumn for better performance when search
  # Use .where to delegate the load for user_events for the database layer(That collumns have a lot of information, so is better don't do any memory operation)
  # sort_by is not efficient when handler a bunch of data, the SQL order_by clause should do a lot better. 
  # The implementation of sort_by is also fairly expensive when the keysets are simples

  times_array = user.user_events.where(created_at: START_RANGE..END_RANGE).order(created_at: :desc).map do |event| 
    if event.last_known_session.present?
      @employers[user.name] ||= []
      @partners[user.name] ||= []
      @employers[user.name] << event.last_known_session["employer"]
      @partners[user.name] << event.last_known_session["partner"]
    end

    @controller_resources[user.name] ||= []
    @controller_resources[user.name] << event.data["params"]["controller"]
    # We should have a timestamp collumn for doing data operation in a better way.
    if last_event_created_at.nil? || last_event_created_at + 10.minutes < event.created_at
      time += event.created_at - last_event_created_at if last_event_created_at
    end
    last_event_created_at = event.created_at
    time
  end
  ## @Distinct_groups will have the total time for the users. Each user will have their name as the hash key.
  @distinct_groups[user.name] = times_array.sum
end
