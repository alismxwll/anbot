class SitesController < ApplicationController
  before_action :authenticate_user!
  def new
    @site = Site.new
  end

  def create
    @site = Site.create(site_params)
    if @site.valid?
      flash[:notice] = 'Site should be deploying, if you run into any issues, contact us!'
      redirect_to site_path @site
    else
      flash[:alert] = 'The site could not be created!'
      render 'new'
    end
  end

  private
  def site_params
    params.require(:site).permit(:user_id, :title).merge(:user_id => current_user.id)
  end
end
