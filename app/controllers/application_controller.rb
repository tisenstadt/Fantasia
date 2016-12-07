class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include StoriesHelper
  include PagesHelper
  include ChoicesHelper
  include RatingsHelper
end
