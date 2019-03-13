class Pages::IndexPage < MainLayout
  needs pages : PageQuery

  def content
    h1 "All Pages"
    ul do
      @pages.each do |page|
        li do
          h2 "#{page.id}: #{page.title}"
          para page.body.to_s
        end
      end
    end
    link "New Page", to: Pages::New
  end
end
