class Widgets::PollsController < ApplicationController
  def index
    @polls = PollSet.find(params[:poll_set_id]).polls 
  end

  def new    
    @poll_set = PollSet.find(params[:poll_set_id])
    @poll = Poll.new
    4.times do 
      @poll.options.build
    end
  end

  def create
    @poll_set = PollSet.find(params[:poll_set_id])
    @poll = Poll.new(params[:poll])
    if @poll.save
      redirect_to community_page_path(@poll_set.community, @poll_set.page) 
    else  
      render :action => "new"
    end
  end

  def show
    @poll = Poll.find params[:id]
  end

  def update
    @poll = Poll.find(params[:id])
    if @poll.update_attributes(params[:poll])
      # redirect_to @poll, :notice  => "Successfully updated survey."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @poll = Poll.find(params[:id])
    @poll.destroy
    # redirect_to surveys_url, :notice => "Successfully destroyed survey."
  end
end
