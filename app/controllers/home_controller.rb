class HomeController < ApplicationController
  def index
    CheckOldUsersJob.perform_later
  end
end
