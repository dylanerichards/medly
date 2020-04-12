ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'
require 'active_support/duration'

namespace :medicine do
  task :send_reminders do
    twilio_account_sid = "AC4bf52c17125e47be385b764e50474a64"
    twilio_auth_token = "0231a729464dedc96dd783b0a39c9ba8"

    twilio_client = Twilio::REST::Client.new twilio_account_sid, twilio_auth_token

    User.all.map(&:medicines).flatten.each do |medicine|

      if medicine.last_reminder_sent_at
        if (Time.now - medicine.interval.minutes) >= medicine.last_reminder_sent_at
          "sending..."

          twilio_client.messages.create(
            from: '+18503785628',
            to: '+15169672755',
            body: "Please take your #{medicine.name}"
          )
        end

        medicine.last_reminder_sent_at = Time.now
        medicine.save
      else
        medicine.last_reminder_sent_at = Time.now
        medicine.save

        if (Time.now - medicine.interval.minutes) >= medicine.last_reminder_sent_at
          "sending..."

          twilio_client.messages.create(
            from: '+18503785628',
            to: '+15169672755',
            body: "Please take your #{medicine.name}"
          )
        end
      end
    end
  end
end
