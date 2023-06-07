namespace :user do
  desc "Enrich all users with Clearbit (async)"
  task update_all: :environment do
    users = User.all
    users.each do |user|
      UpdateUserJob.perform_later(user)
      puts "Enriched for #{user.email}"
    end
  end

  desc "Enrich with Clearbit for ONE specific User (async)"
  task update: :environment do
    user = User.find(ENV["USER_ID"])
    puts "Enriching #{user.email}..."
    UpdateUserJob.perform_now(user)
    # rake task will return when job is _done_
  end
end
