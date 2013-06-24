class WidgetList::QaWidget < Apotomo::Widget
  responds_to_event :delete_widget, :with => :destroy

  def display
  	@qa = options[:widget]
    render
  end

  def destroy(evt)
  	# page_id = Announcement.find(evt[:widget_id]).page.id
    page = Qa.find(evt[:widget_id]).page
  	Qa.find(evt[:widget_id]).destroy
  	trigger :widgetDeleted, :page => page
  end

end
