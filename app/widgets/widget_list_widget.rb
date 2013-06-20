class WidgetListWidget < Apotomo::Widget
  responds_to_event :widgetAdded, :with => :process_add, :passing => :page	
  responds_to_event :widgetDeleted, :with => :process_delete, :passing => :page		
    
  has_widgets do
    Page.find(params[:id]).widgets.each do |w|
      self << widget("widget_list/#{w.class.to_s.camelize(:lower)}", "#{w.class.to_s.camelize(:lower)}-#{w.id}", :widget => w)
    end
  end

  def display(options)
    @page = options[:page]
    @widgets = @page.widgets
    render
  end

  def process_add(evt)
    w = evt[:widget]
    self << widget("widget_list/#{w.class.to_s.camelize(:lower)}", "#{w.class.to_s.camelize(:lower)}-#{w.id}", :widget => w)

    replace "##{widget_id} ul", {:state => :list}, w.page.widgets 
  end  

  def process_delete(evt)
    # @page = Page.find evt[:page_id]
    @page = evt[:page]
    @page.reload

    replace "##{widget_id} ul", {:state => :list}, @page.widgets
  end

  def list(widgets)
    render :locals => {:widgets => widgets}
  end 

end
