class Pages::Edit < BrowserAction
  get "/pages/:id/edit" do
    page = PageQuery.new.find(id)
    form = PageForm.new(page)
    render EditPage, page: page, form: form
  end
end
