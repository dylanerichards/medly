set :environment, "development"

every 1.minute do
  rake "medicine:send_reminders"
end
