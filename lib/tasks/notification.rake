namespace :notification do
  desc "Sends SMS notification to emloyees asking them to log if they had OT or not."
  task sms: :environment do
    puts "I'm in a rake task"
  end
end
