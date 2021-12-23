# frozen_string_literal: true

class Api::ApplicationController < ActionController::API
  # protect_from_forgery with: :null_session
  respond_to :json
  # protect_from_forgery with: :exception
end
