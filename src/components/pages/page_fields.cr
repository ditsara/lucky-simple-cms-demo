module Pages::PageFields
  private def render_page_fields(f)
    field(f.title) { |i| text_input i }
    field(f.body) { |i| text_input i }
  end
end
