class PagesController < ApplicationController
  before_filter :require_login!
  def home
  end
end
