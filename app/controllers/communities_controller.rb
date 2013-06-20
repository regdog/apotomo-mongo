class CommunitiesController < ApplicationController
  has_widgets do |root|    
    root << widget(:new_community)
    root << widget(:community_list) 
    root << widget(:page_list, :community => @community)  
  end

  def index
  end

  def show
  	@community = Community.find(params[:id])
  	@page = @community.pages.first
  	if @page.nil?
  	  redirect_to admin_community_url
  	else
      redirect_to community_page_url(@community, @page)
  	end
  end  

  def admin
  	@community = Community.find(params[:id])
  end
end
