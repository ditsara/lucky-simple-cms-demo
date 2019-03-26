class Public::ShowPage < GuestLayout
  needs page : Page

  def content
    div do
      raw @page.body || ""
    end
  end
end
