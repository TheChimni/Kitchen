class ApplicationController < ActionController::Base
  protect_from_forgery
  http_basic_authenticate_with name: 'chimni', password: 'grumpybumps' if Rails.env.production?
end
