namespace :notification do
  desc "Sends SMS notification to emloyees asking them to log if they had OT or not."
  task sms: :environment do
    # 1. Schedule to run at Sunday at 5pm
    # 2. Iterate over all employees
    # 3. Skip AdminUsers
    # 4. Send a msg that has instructions and a link to log time
    # User.all.each do |user|
    #   SmsTool.send_sms()
    # end
  end

  desc "Sends email notification to managers (admin users) each day to inform of pending OT requests."
  task manager_email: :environment do
    submitted_posts = Post.submitted
    admin_users = AdminUser.all

    if submitted_posts.count > 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_now
      end
    end
  end
end
