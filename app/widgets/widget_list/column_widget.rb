class WidgetList::ColumnWidget < AuthorizableWidget
  responds_to_event :delete_widget, :with => :destroy

  def display
  	@column = options[:widget]
    render
  end
  
  def destroy(evt)
    page = Column.find(evt[:widget_id]).page
  	Column.find(evt[:widget_id]).destroy
  	trigger :widgetDeleted, :page => page
  end
end
