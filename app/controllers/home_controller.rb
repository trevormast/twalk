class HomeController < ApplicationController
	before_action :set_presentations

  add_breadcrumb "Home", :root_path
  
  def index
  end

  private
  	def set_presentations
  		@presentations ||= Presentation.all.order(created_at: :desc)
    	@nearby_presentations = Presentation.near(current_user_latlon)

      if user_signed_in?
        @my_presentations = Presentation.for(current_user.id)
      end
  	end
end
