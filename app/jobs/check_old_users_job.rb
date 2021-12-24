class CheckOldUsersJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    User.all.each do |user|
      Rails.logger.debug user.name if (Time.zone.now - user.last_sign_in_at) / 86_400 > 30
    end
  end

  # puts @user.name
end
