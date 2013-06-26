class WidgetList::BulletinWidget < AuthorizableWidget
  responds_to_event :delete_widget, :with => :destroy

  def display(options)
  	@bulletin = options[:widget]
    render
  end

  def form
    render
  end

  def destroy(evt)
    page = Bulletin.find(evt[:widget_id]).page
  	Bulletin.find(evt[:widget_id]).destroy
  	trigger :widgetDeleted, :page => page
  end

end