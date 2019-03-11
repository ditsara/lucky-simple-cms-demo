class Pages::NewPage < MainLayout
  needs form : PageForm

  def content
    h1 "New Page"

    render_new_page_form(@form)
  end

  private def render_new_page_form(f)
    form_for Pages::Create do
      page_fields(f)
      submit "Create Page"
    end
  end

  private def page_fields(f)
    field(f.title) { |i| text_input i }
    field(f.body) { |i| text_input i }
  end
end
