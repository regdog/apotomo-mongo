class WidgetList::PollSetWidget < Apotomo::Widget
  responds_to_event :delete_widget, :with => :destroy	

  def display
  	@poll_set = options[:widget]
  	render
  end

  def destroy(evt)
    page = PollSet.find(evt[:widget_id]).page
  	PollSet.find(evt[:widget_id]).destroy
  	trigger :widgetDeleted, :page => page
  end

end
