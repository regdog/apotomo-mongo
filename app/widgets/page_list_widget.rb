class PageListWidget < Apotomo::Widget
  responds_to_event :updateName, :with => :update, :passing => :root	

  def display(options)
  	@community = options[:community]
  	@pages = @community.pages

    render
  end

  def update(evt)
  	id = evt[:page].id
  	name = evt[:page].name
  	render :text => "$(\"li[data-id=#{id}] :first-child\").text(\"#{name}\");"
  end	

end
