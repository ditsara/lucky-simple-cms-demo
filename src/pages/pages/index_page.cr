class Pages::IndexPage < MainLayout
  needs pages : PageQuery

  def content
    h1 "All Pages"
    ul do
      @pages.each do |page|
        li do
          link page.id, to: Pages::Show.with(slug: page.slug)
          text "#{page.id} #{page.slug}: #{page.title}"
        end
      end
    end
    link "New Page", to: Pages::New
  end
end
