class Public::Show < BrowserAction
  include Auth::SkipRequireSignIn

  get "/p/:slug" do
    p = PageQuery.new.find_by_slug(slug)
    render ShowPage, page: p
  end
end
