class Pages::EditPage < MainLayout
  include PageFields
  needs form : PageForm
  needs page : Page

  def content
    h1 "Edit Page"

    render_edit_page_form(@form)
  end

  private def render_edit_page_form(f)
    form_for Pages::Update.with(id: @page.id) do
      render_page_fields(f)
      submit "Update Page"
    end
  end
end
