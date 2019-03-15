class Pages::Show < BrowserAction
  include Auth::SkipRequireSignIn

  get "/pages/:slug" do
    p = PageQuery.new.find_by_slug(slug)
    render ShowPage, page: p
  end
end
