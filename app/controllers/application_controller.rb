class ApplicationController < ActionController::Base
  protect_from_forgery
  http_basic_authenticate_with name: 'thechimni', password: 'I have fresh methi' if Rails.env.production?
end
