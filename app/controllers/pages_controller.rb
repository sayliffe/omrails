class PagesController < ApplicationController
  def home
  	@admin = user_signed_in?&&current_user.admin?
  end
  
  def about
  end

end
