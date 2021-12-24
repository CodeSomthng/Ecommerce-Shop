class CheckOldUsersJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    @users = User.all.limit(20)
    @users.all.each do |user|
      user.destroy! if (Time.zone.now - user.last_sign_in_at) / 86_400 > 30
    end
  end

  # puts @user.name
end
