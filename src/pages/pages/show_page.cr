class Pages::ShowPage < GuestLayout
  needs page : Page

  def content
    raw @page.body || ""
  end
end
