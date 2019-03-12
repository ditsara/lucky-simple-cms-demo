class Pages::IndexPage < MainLayout
  needs pages : PageQuery

  def content
    h1 "All Pages"
    ul do
      @pages.each do |page|
        li "#{page.id}: #{page.title}"
      end
    end
    link "New Page", to: Pages::New
  end
end
