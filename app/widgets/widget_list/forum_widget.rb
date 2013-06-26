class WidgetList::ForumWidget < AuthorizableWidget
  responds_to_event :delete_widget, :with => :destroy	

  def display(options)
  	@forum = options[:widget]
    render
  end

  def destroy(evt)
  	# page_id = Announcement.find(evt[:widget_id]).page.id
    page = Forum.find(evt[:widget_id]).page
  	Forum.find(evt[:widget_id]).destroy
  	trigger :widgetDeleted, :page => page
  end

end
