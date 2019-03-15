class Pages::Edit < BrowserAction
  get "/pages/:id/edit" do
    p = PageQuery.new.find(id)
    render NewPage, form: PageForm.new
  end
end
