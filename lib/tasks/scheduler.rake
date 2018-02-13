desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Updating feed..."
  NewsFeed.update
  puts "Done."
end

task :first_session_reminder => :environment do
  users = User.all
  users.each do |user|
    if user.appointment
      if (Time.zone.now >= (user.appointment - 48.hours)) && (Time.zone.now < (user.appointment + 8.hours))
        UserMailer.first_session_email(user).deliver 
      end
    end
  end
end

task :second_session_reminder => :environment do
  users = User.all
  users.each do |user|
    if user.second_appointment 
      if (Time.zone.now >= (user.second_appointment - 48.hours)) && (Time.zone.now < (user.second_appointment + 8.hours))
        UserMailer.second_session_email(user).deliver 
      end
    end
  end
end

task :third_session_reminder => :environment do
  users = User.all
  users.each do |user| 
    if user.third_appointment
      if (Time.zone.now >= (user.third_appointment - 48.hours)) && (Time.zone.now < (user.third_appointment + 8.hours))
        UserMailer.third_session_email(user).deliver 
      end
    end
  end
end