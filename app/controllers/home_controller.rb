class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    if signed_in?
      redirect_to categories_path
    else
      render :index
    end
  end
end
