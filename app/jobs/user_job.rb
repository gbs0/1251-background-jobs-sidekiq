class UserJob < ApplicationJob
  queue_as :default

  def perform(user)
    UserMailer.welcome(user.id).deliver_later
    # Do something later
  end
end
