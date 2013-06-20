class PagesController < ApplicationController
  has_widgets do |root|
    root << widget(:page_list)
    root << widget(:page)
  end
  	
  def show
  	@page = Page.find(params[:id])
  	@community = @page.community
  end

  def create
  	community = Community.find params[:community_id]
  	page = community.pages.create
  	redirect_to community_page_path(community, page) 
  end	

  def destroy
  	c = Page.find(params[:id]).community
  	if Page.find(params[:id]).destroy
  	  redirect_to community_path(c)
  	end  	
  end	
end
