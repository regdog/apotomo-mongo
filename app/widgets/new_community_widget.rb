class NewCommunityWidget < Apotomo::Widget
  responds_to_event :submit		

  def display
    render
  end

  def submit(evt)
  	community = Community.create(evt[:community])
  	trigger :newCommunity, :task => community
  	replace :view => :display
  end
end
