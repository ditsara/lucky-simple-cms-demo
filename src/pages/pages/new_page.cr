class Pages::NewPage < MainLayout
  include PageFields
  needs form : PageForm

  def content
    h1 "New Page"

    render_new_page_form(@form)
  end

  private def render_new_page_form(f)
    form_for Pages::Create do
      render_page_fields(f)
      submit "Create Page"
    end
  end
end
