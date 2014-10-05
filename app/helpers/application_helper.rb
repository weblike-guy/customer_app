module ApplicationHelper

  def document_title
    if @title.present?
     "#{@title} - Customer app"
    else
     "Customer app"
    end
  end
end
