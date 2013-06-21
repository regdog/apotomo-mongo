class AddWidgetsWidget < Apotomo::Widget
  responds_to_event :new_widget	

  has_widgets do
    self << widget("page/setting", :page_setting, :page => @page)
  end

  def display(options)
  	@page = options[:page]
    render
  end
  
  def new_widget(evt)
  	page = Page.find evt[:id]
    class_name = evt[:category].to_s.camelize
    widget = class_name.constantize.create(:community_id => page.community.id, :page_id => page.id)
  	trigger :widgetAdded, :widget => widget
  end

end
