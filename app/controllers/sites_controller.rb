class SitesController < ApplicationController
  before_action :authenticate_user!
  def new
    @site = Site.new
  end
end
