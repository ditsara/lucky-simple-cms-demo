class Pages::Index < BrowserAction
  get "/pages" do
    pages = PageQuery.new
    render IndexPage, pages: pages
  end
end
