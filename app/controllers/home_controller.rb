class HomeController < ApplicationController
  def index
    CheckOldUsersJob.perform_later 1, 2, 3
  end
end
