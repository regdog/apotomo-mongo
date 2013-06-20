class Page::SettingWidget < Apotomo::Widget
  responds_to_event :submit

  def display(options = {})
  	@page = options[:page]
    render
  end

  def submit(evt)
    @page = Page.find evt[:id]
  	if @page.update_attributes(evt[:page])
  	  trigger :updateName, :page => @page	
  	end
  end

end
