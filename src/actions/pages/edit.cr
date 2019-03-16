class Pages::Edit < BrowserAction
  get "/pages/:id/edit" do
    page = PageQuery.new.find(id)
    form = PageForm.new({ "title" => "hi"})
    render NewPage, page: page, form: form
  end
end
