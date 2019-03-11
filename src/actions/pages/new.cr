class Pages::New < BrowserAction
  get "/pages/new" do
    render NewPage, form: PageForm.new
  end
end
