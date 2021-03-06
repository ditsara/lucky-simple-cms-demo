class Pages::IndexPage < MainLayout
  needs pages : PageQuery

  def content
    h1 "All Pages"
    ul do
      @pages.each do |page|
        li do
          link "#{page.id}: #{page.slug}", to: Public::Show.with(slug: page.slug)
          text ": #{page.title}"
          link " (edit)", to: Pages::Edit.with(id: page.id)
          link " (delete)", to: Pages::Destroy.with(id: page.id)
        end
      end
    end
    link "New Page", to: Pages::New
  end
end
