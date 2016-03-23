class FormPresenter
  include HtmlBuilder

  attr_reader :form_builder, :view_context
  delegate :label, :text_field, :passwrod_field, :check_box, :radio_button,
    :text_area, :object, to: :form_builde

  def initialize(form_builder, view_context)
    @form_builder = form_builder
    @view_context = view_context
  end
end
